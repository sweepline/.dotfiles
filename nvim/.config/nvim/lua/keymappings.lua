local utils = require('utils')

-- LSP Keymappings are in `lsp.lua`

utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear Highlights
utils.map('i', 'jk', '<Esc>') -- jk to escape
utils.map('i', '<C-Space>', '<C-x><C-o>')

utils.map('n', '<Leader>ff', '<cmd>Telescope find_files<CR>')
utils.map('n', '<Leader>fr', '<cmd>Telescope resume<CR>')
utils.map('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>')
utils.map('n', '<Leader>fb', '<cmd>Telescope buffers<CR>')
utils.map('n', '<Leader>fh', '<cmd>Telescope help_tags<CR>')
utils.map('n', '<Leader>ft', '<cmd>Telescope treesitter<CR>')
utils.map('n', '<Leader>fu', '<cmd>Telescope builtin<CR>')

utils.map('n', '<Leader>ii', '<cmd>Git<CR>') -- Git status
utils.map('n', '<Leader>ic', '<cmd>Telescope git_bcommits<CR>')
utils.map('n', '<Leader>ib', '<cmd>Telescope git_branches<CR>')
utils.map('n', '<Leader>is', '<cmd>Telescope git_status<CR>')
