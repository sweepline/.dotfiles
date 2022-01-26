local utils = require('utils')

-- LSP Keymappings are in `lsp.lua`

utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear Highlights
utils.map('i', 'jk', '<Esc>') -- jk to escape
utils.map('i', '<C-Space>', '<C-x><C-o>')

utils.map('n', '<Leader>ff', '<cmd>Telescope find_files<CR>')
utils.map('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>')
utils.map('n', '<Leader>fb', '<cmd>Telescope buffers<CR>')
utils.map('n', '<Leader>fh', '<cmd>Telescope help_tags<CR>')

utils.map('n', '<Leader>gs', '<cmd>Git<CR>') -- Git status
