local utils = require('utils')
local configs = require('nvim-treesitter.configs')

configs.setup {
	ensure_installed = "maintained",
	highlight = {
		enable = true,
	},
}

--utils.opt('o', 'foldmethod', 'expr')
--utils.opt('o', 'foldexpr', 'nvim_treesitter#foldexpr()')
