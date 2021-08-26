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

utils.map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>')
utils.map('n', '<Leader>r', '<cmd>NvimTreeRefresh<CR>')
utils.map('n', '<Leader>n', '<cmd>NvimTreeFindFile<CR>')

-- <Tab> to navigate the completion menu, just use C-p and C-n
--utils.map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
--utils.map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
