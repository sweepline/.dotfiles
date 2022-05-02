local configs = require("nvim-treesitter.configs")

configs.setup {
	highlight = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<M-w>",
			node_incremental = "<M-w>",
			scope_incremental = "<M-e>",
			node_decremental = "<M-C-w>"
		}
	},
	indent = { enable = true }
}

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd("set foldlevelstart=20") -- start folded
vim.wo.foldnestmax = 3
vim.wo.foldminlines = 5
