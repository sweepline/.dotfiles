local nvim_lsp = require('lspconfig')
local saga = require('lspsaga')

-- Icons
vim.lsp.protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '' -- TypeParameter
}

-- Your custom attach function for nvim-lspconfig goes here.
local on_attach = function(client, bufnr)
    -- Enable nvimlua/completion-nvim
    require('completion').on_attach(client, bufnr)

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = {noremap = true, silent = true}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gh',
                   '<cmd>lua require("lspsaga.provider").preview_definition()<CR>',
                   opts)
    buf_set_keymap('n', 'K',
                   '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>',
                   opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>',
                   '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>',
                   opts)
    buf_set_keymap('n', '<leader>D',
                   '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn',
                   '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)
    buf_set_keymap('n', '<leader>ca',
                   '<cmd>lua require("lspsaga.codeaction").code_action()<CR>',
                   opts)
    buf_set_keymap('v', '<leader>ca',
                   ':<C-U>lua require("lspsaga.codeaction").range_code_action()<CR>',
                   opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>e',
                   '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>',
                   opts)
    buf_set_keymap('n', '[d',
                   '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>',
                   opts)
    buf_set_keymap('n', ']d',
                   '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>',
                   opts)
    buf_set_keymap('n', '<C-f>', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

saga.init_lsp_saga({
    code_action_prompt = {enable = false},
    max_preview_lines = 20
})

-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.html.setup {on_attach = on_attach, capabilities = capabilities}

nvim_lsp.pyright.setup {on_attach = on_attach}

nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                allFeatures = true,
                overrideCommand = {
                    'cargo', 'clippy', '--workspace', '--message-format=json',
                    '--all-targets', '--all-features'
                }
            }
        }
    }
}

nvim_lsp.stylelint_lsp.setup {
    on_attach = on_attach,
    settings = {stylelintplus = {autoFixOnFormat = true, cssInJs = true}},
    filetypes = {'css', 'less', 'scss'}
}

nvim_lsp.tsserver.setup {
    on_attach = function(client, bufnr)
        if client.config.flags then
            client.config.flags.allow_incremental_sync = true
        end
        client.resolved_capabilities.document_formatting = false
        on_attach(client, bufnr)
    end

}

nvim_lsp.clangd.setup {on_attach = on_attach}

nvim_lsp.gdscript.setup {on_attach = on_attach}

local prettier = {
    formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
    formatStdin = true
}

local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename ${INPUT}",
    formatStdin = true
}

local autopep8 = {formatCommand = "autopep8 -", formatStdin = true}

local luaformat = {formatCommand = 'lua-format -i', formatStdin = true}

local languages = {
    lua = {luaformat},
    typescript = {eslint},
    javascript = {eslint},
    typescriptreact = {eslint},
    javascriptreact = {eslint},
    json = {prettier},
    html = {prettier},
    -- css = {prettier},
    -- scss = {prettier},
    markdown = {prettier}
}

nvim_lsp.efm.setup {
    on_attach = on_attach,
    init_options = {documentFormatting = true, codeAction = true},
    filetypes = vim.tbl_keys(languages),
    settings = {rootMarkers = {'.git/'}, languages = languages}
}

