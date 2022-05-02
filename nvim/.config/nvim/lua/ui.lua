local utils = require('utils')
local cmd = vim.cmd
local lualine = require('lualine')

lualine.setup {
    options = {
        theme = 'auto',
        -- section_separators = {'', ''},
        -- component_separators = {'', ''},
        section_separators = '',
        component_separators = ''
    },
    sections = {lualine_c = {{'filename', file_status = true, path = 1}}}
}

-- Colorcheme
utils.opt('o', 'termguicolors', true)
vim.opt.background = 'dark'

cmd 'colorscheme zephyr'
--cmd 'colorscheme gruvbox'
