local utils = require('utils')

local cmd = vim.cmd
local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'
utils.opt('o', 'expandtab', false)
utils.opt('o', 'shiftwidth', indent)
utils.opt('o', 'smartindent', true)
utils.opt('o', 'tabstop', indent)
utils.opt('o', 'shiftround', true)

utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'scrolloff', 8)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('o', 'cursorline', false)
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', false)

-- Highlight yank
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'


cmd 'au BufRead /home/mikkel/repos/mono/**.py setlocal sw=4 ts=4 sts=4 noet'

