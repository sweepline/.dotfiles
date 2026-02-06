require("mason").setup()
require("mason-lspconfig").setup()
local navic = require("nvim-navic")

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

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', "<cmd>Telescope diagnostics bufnr=0<CR>")

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

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client.server_capabilities.documentSymbolProvider then
			navic.attach(client, ev.buf)
		end
	end,
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		-- Mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
		vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
		vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
		vim.keymap.set("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", opts)
		vim.keymap.set("n", "gS", "<cmd>Telescope lsp_workspace_symbols<CR>", opts)

		vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

		vim.keymap.set("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
		vim.keymap.set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
		vim.keymap.set("n", "<space>cr", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)

		vim.keymap.set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
		vim.keymap.set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
		vim.keymap.set("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	end,
})

vim.lsp.config("*", {
	capabilities = capabilities,
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
	capabilities = vim.tbl_extend('force', capabilities, { general = { positionEncodings = { "utf-16" } } }),
})
vim.lsp.enable("rust_analyzer")

-- Other
vim.lsp.config("lua_ls", {
	settings = {
		Lua = { diagnostics = { globals = { "vim", "use" } } } }
})
vim.lsp.enable("lua_ls")
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
