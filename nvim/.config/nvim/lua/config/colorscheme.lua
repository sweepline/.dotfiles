local utils = require('utils')
local cmd = vim.cmd

utils.opt('o', 'termguicolors', true)
vim.g.gruvbox_material_palette = 'mix'
vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_enable_italic = 1
cmd 'colorscheme gruvbox-material'
