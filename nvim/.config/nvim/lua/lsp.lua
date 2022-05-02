local nvim_lsp = require("lspconfig")

-- Icons
vim.lsp.protocol.CompletionItemKind = {
    "", -- Text
    "", -- Method
    "", -- Function
    "", -- Constructor
    "", -- Field
    "", -- Variable
    "", -- Class
    "ﰮ", -- Interface
    "", -- Module
    "", -- Property
    "", -- Unit
    "", -- Value
    "", -- Enum
    "", -- Keyword
    "﬌", -- Snippet
    "", -- Color
    "", -- File
    "", -- Reference
    "", -- Folder
    "", -- EnumMember
    "", -- Constant
    "", -- Struct
    "", -- Event
    "ﬦ", -- Operator
    "" -- TypeParameter
}

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Mappings
local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap("n", "<space>e",
                        "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>",
                        opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>",
                        opts)
vim.api.nvim_set_keymap("n", "<space>q",
                        "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
vim.api.nvim_set_keymap("n", "<space><Tab>", "<cmd>lua vim.lsp.buf.formatting()<CR>",
                        opts)

-- Your custom attach function for nvim-lspconfig goes here.
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd",
                                "<cmd>Telescope lsp_definitions<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi",
                                "<cmd>Telescope lsp_implementations<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gt",
                                "<cmd>Telescope lsp_type_definitions<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr",
                                "<cmd>Telescope lsp_references<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gs",
                                "<cmd>Telescope lsp_document_symbols<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gS",
                                "<cmd>Telescope lsp_workspace_symbols<CR>", opts)

    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>",
                                "<cmd>lua vim.lsp.buf.signature_help()<CR>",
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K",
                                "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn",
                                "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca",
                                "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>cr",
                                "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)

    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa",
                                "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr",
                                "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wl",
                                "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
                                opts)

end

nvim_lsp.html.setup {
    cmd = {"vscode-html-languageserver", "--stdio"},
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.cssls.setup {
    cmd = {"vscode-css-languageserver", "--stdio"},
    on_attach = on_attach,
    capabilities = capabilities
}

local eslint_on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space><Tab>",
                                "<cmd>:execute 'lua vim.lsp.buf.formatting()' | EslintFixAll <CR>",
                                opts)
end

nvim_lsp.eslint.setup {
    cmd = {"vscode-eslint-language-server", "--stdio"},
    on_attach = eslint_on_attach,
    capabilities = capabilities
}

nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {Lua = {diagnostics = {globals = {"vim", "use"}}}}
}

nvim_lsp.pyright.setup {on_attach = on_attach, capabilities = capabilities}

nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    -- settings = {
    --     ["rust-analyzer"] = {
    --         checkOnSave = {
    --             allFeatures = true,
    --             overrideCommand = {
    --                 "cargo", "clippy", "--workspace", "--message-format=json",
    --                 "--all-targets", "--all-features"
    --             }
    --         }
    --     }
    -- }
}

nvim_lsp.tsserver.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        if client.config.flags then
            client.config.flags.allow_incremental_sync = true
        end
        client.resolved_capabilities.document_formatting = false
        on_attach(client, bufnr)
    end

}

nvim_lsp.clangd.setup {on_attach = on_attach, capabilities = capabilities}

nvim_lsp.gdscript.setup {on_attach = on_attach, capabilities = capabilities}

-- EFM Setup for ESLint

local prettier = {
    formatCommand = "prettier --stdin-filepath ${INPUT}",
    formatStdin = true
}

local stylelint = {
    lintCommand = "stylelint --stdin --stdin-filename ${INPUT} --formatter compact",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {
        "%f: line %l, col %c, %tarning - %m", "%f: line %l, col %c, %trror - %m"
    },
    formatCommand = "prettier --stdin-filepath ${INPUT}",
    formatStdin = true
}

local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    -- formatCommand = "prettier --stdin-filepath ${INPUT}",
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename ${INPUT}",
    formatStdin = true
}

-- local autopep8 = {formatCommand = "autopep8 -", formatStdin = true}
local black = {formatCommand = "black -", formatStdin = true}

local luaformat = {formatCommand = "lua-format -i", formatStdin = true}

local languages = {
    lua = {luaformat},
    -- typescript = {eslint},
    -- javascript = {eslint},
    -- typescriptreact = {eslint},
    -- javascriptreact = {eslint},
    json = {prettier},
    html = {prettier},
    css = {stylelint},
    scss = {stylelint},
    markdown = {prettier},
    python = {black}
}

nvim_lsp.efm.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {documentFormatting = true, codeAction = true},
    filetypes = vim.tbl_keys(languages),
    settings = {rootMarkers = {".git/"}, languages = languages}
}

