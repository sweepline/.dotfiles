local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then options = vim.tbl_extend("force", options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- LSP Keymappings are in `lsp.lua`
-- Some completion keymaps in `completion.lua`

map("n", "<C-l>", "<cmd>noh<CR>") -- Clear Highlights
map("i", "jk", "<Esc>") -- jk to escape
map("i", "<C-Space>", "<C-x><C-o>")
map("t", "<Esc>", "<C-\\><C-n>")

map("n", "<Leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<Leader>fr", "<cmd>Telescope resume<CR>")
map("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<Leader>fb", "<cmd>Telescope buffers<CR>")
map("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>")
map("n", "<Leader>ft", "<cmd>Telescope treesitter<CR>")
map("n", "<Leader>fu", "<cmd>Telescope builtin<CR>")

map("n", "<Leader>ii", "<cmd>Git<CR>") -- Git status
map("n", "<Leader>ic", "<cmd>Telescope git_bcommits<CR>")
map("n", "<Leader>ib", "<cmd>Telescope git_branches<CR>")
map("n", "<Leader>is", "<cmd>Telescope git_status<CR>")

-- Split resizing
map("n", "<C-w>>", "20<C-w>>")
map("n", "<C-w><", "20<C-w><")

-- surround
require("nvim-surround").setup({})
