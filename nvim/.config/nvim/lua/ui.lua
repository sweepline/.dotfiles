local lualine = require("lualine")

lualine.setup {
	options = {
		theme = "rose-pine",
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
vim.opt.background = "dark"
vim.cmd("colorscheme rose-pine")
