local lualine = require("lualine")

lualine.setup {
	options = {
		theme = "gruvbox-material",
		-- section_separators = {"", ""},
		-- component_separators = {"", ""},
		section_separators = "",
		component_separators = ""
	},
	sections = { lualine_c = { { "filename", file_status = true, path = 1 } } }
}

-- Colorcheme

require("rose-pine").setup({
	---@usage "main"|"moon"
	dark_variant = "main"
})

vim.opt.termguicolors = true
vim.opt.background = "light"
-- vim.cmd("colorscheme rose-pine")
vim.cmd("colorscheme gruvbox-material")
