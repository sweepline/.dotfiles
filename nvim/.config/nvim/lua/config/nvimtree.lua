local utils = require('utils')

vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
vim.g.nvim_tree_highlight_opened_files = true
vim.g.nvim_tree_respect_buf_cwd = true

utils.map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>')
utils.map('n', '<Leader>r', '<cmd>NvimTreeRefresh<CR>')
utils.map('n', '<Leader>n', '<cmd>NvimTreeFindFile<CR>')
