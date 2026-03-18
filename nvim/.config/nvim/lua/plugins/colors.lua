return {
	-- Color schemes
	{
		"sainnhe/gruvbox-material",
		name = "gruvbox-material",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruvbox-material")
		end,

	},
	{
		"rose-pine/neovim",
		lazy = true,
		name = "rose-pine",
		config = function()
			-- vim.cmd.colorscheme("rose-pine")
		end,
		opts = {
			dark_variant = "main",
		}
	}
}
