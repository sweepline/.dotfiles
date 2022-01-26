local utils = require( 'utils')
local configs = require('nvim-treesitter.configs')

configs.setup {
    ensure_installed = "maintained",
    highlight = {enable = true},
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<M-w>",
            node_incremental = "<M-w>",
            scope_incremental = "<M-e>",
            node_decremental = "<M-C-w>"
        }
    },
    indent = {enable = true}
}

--utils.opt('o', 'foldlevelstart', 20)
--utils.opt('o', 'foldmethod', 'expr')
--utils.opt('o', 'foldexpr', 'nvim_treesitter#foldexpr()')
