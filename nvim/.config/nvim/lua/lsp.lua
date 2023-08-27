require("mason").setup()
require("mason-lspconfig").setup()
local nvim_lsp = require("lspconfig")

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

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

-- Mappings
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<space>e",
	"<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>",
	opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>",
	opts)
vim.api.nvim_set_keymap("n", "<space>q",
	"<cmd>Telescope diagnostics bufnr=0<CR>", opts)
local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		async = true,
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls" or client.name == "lua_ls" or client.name == "rust_analyzer"
		end,
		bufnr = bufnr,
	})
end
vim.keymap.set("n", "<space><Tab>", lsp_formatting);
-- vim.api.nvim_set_keymap("n", "<space><Tab>",
--	"<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)


-- Your custom attach function for nvim-lspconfig goes here.
local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
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
		"<cmd>lua vim.lsp.buf.range_code_action()<CR>",
		opts)

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

nvim_lsp.html.setup({ capabilities = capabilities, on_attach = on_attach })
nvim_lsp.cssls.setup({ capabilities = capabilities, on_attach = on_attach })
nvim_lsp.unocss.setup({ capabilities = capabilities, on_attach = on_attach })
nvim_lsp.cssmodules_ls.setup({ capabilities = capabilities, on_attach = on_attach })
nvim_lsp.tsserver.setup({ capabilities = capabilities, on_attach = on_attach })

nvim_lsp.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = { diagnostics = { globals = { "vim", "use" } } } }
})

nvim_lsp.pyright.setup({ capabilities = capabilities, on_attach = on_attach })

nvim_lsp.rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	-- settings = { ["rust-analyzer"] = { checkOnSave = { command = "clippy" } } }k
	--         checkOnSave = {
	--             allFeatures = true,
	--             overrideCommand = {
	--                 "cargo", "clippy", "--workspace", "--message-format=json",
	--                 "--all-targets", "--all-features"
	--             }
	--         }
	--     }
	-- }
})

nvim_lsp.clangd.setup({ capabilities = capabilities, on_attach = on_attach })
nvim_lsp.gdscript.setup({ capabilities = capabilities, on_attach = on_attach })
nvim_lsp.sqlls.setup({ capabilities = capabilities, on_attach = on_attach })
nvim_lsp.dockerls.setup({ capabilities = capabilities, on_attach = on_attach })
nvim_lsp.wgsl_analyzer.setup({ capabilities = capabilities, on_attach = on_attach })
