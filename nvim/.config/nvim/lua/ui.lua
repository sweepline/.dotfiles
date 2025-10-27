local lualine = require("lualine")

lualine.setup {
	options = {
		theme = "gruvbox-material",
		-- section_separators = {"", ""},
		-- component_separators = {"", ""},
		section_separators = "",
		component_separators = ""
	},
	sections = {
		lualine_c = { { "filename", file_status = true, path = 1 } },
		lualine_x = { 'copilot', 'encoding', 'fileformat', 'filetype' }, -- copilot added to default
	}
}

-- Colorcheme

require("rose-pine").setup({
	---@usage "main"|"moon"
	dark_variant = "main"
})

vim.opt.termguicolors = true
vim.opt.background = "dark"
-- vim.cmd("colorscheme rose-pine")
vim.cmd("colorscheme gruvbox-material")
