require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Show which linter is reporting the error.
vim.diagnostic.config({
	virtual_text = {
		source = "always", -- Or "if_many"
	},
	float = {
		source = "always", -- Or "if_many"
	},
})

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
		async = false,
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "biome" or client.name == "null-ls" or client.name == "lua_ls" or
				client.name == "rust_analyzer" or client.name == "ruff"
		end,
		bufnr = bufnr,
		timeout_ms = 2000,
	})
end
vim.keymap.set("n", "<space><Tab>", lsp_formatting);

-- Your custom attach function for nvim-lspconfig goes here.
---@diagnostic disable-next-line: unused-local
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

vim.lsp.config("*", {
	capabilities = capabilities,
	on_attach = on_attach,
})

-- HTML/CSS/JS/TS/JSX/TSX
vim.lsp.enable("html")
vim.lsp.enable("cssls")
vim.lsp.enable("cssmodules_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("eslint")
vim.lsp.config("stylelint_lsp", {
	filetypes = { "css", "less", "scss", "sugarss", "vue", "wxss" }
})
vim.lsp.enable("stylelint_lsp")
vim.lsp.enable("biome")

-- Python
vim.lsp.enable("jedi_language_server")
vim.lsp.enable("ruff")

-- Rust
vim.lsp.config("rust_analyzer", {
	capabilities = { general = { positionEncodings = { "utf-16" } } },
	on_attach = on_attach,
})
vim.lsp.enable("rust_analyzer")

-- Other
vim.lsp.config("lua_ls", {
	settings = {
		Lua = { diagnostics = { globals = { "vim", "use" } } } }
})
vim.lsp.enable("clangd", {
	settings = {
		offsetEncoding = "utf-16",
	}
})
vim.lsp.enable("gdscript")
vim.lsp.enable("sqlls")
vim.lsp.enable("dockerls")
vim.lsp.enable("docker_compose_language_service")
vim.lsp.enable("wgsl_analyzer")

-- Fixes some crap in rust-analyzer see: https://github.com/neovim/neovim/issues/30985
-- for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
-- 	local default_diagnostic_handler = vim.lsp.handlers[method]
-- 	vim.lsp.handlers[method] = function(err, result, context, config)
-- 		if err ~= nil and err.code == -32802 then
-- 			return
-- 		end
-- 		return default_diagnostic_handler(err, result, context, config)
-- 	end
-- end
