local utils = require('utils')

utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear Highlights
utils.map('i', 'jk', '<Esc>') -- jk to escape
utils.map('i', '<C-Space>', '<C-x><C-o>')

