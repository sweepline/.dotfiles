local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then options = vim.tbl_extend("force", options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- LSP Keymappings are in `lsp.lua`
-- Some completion keymaps in `completion.lua`

map("n", "<C-l>", "<cmd>noh<CR>") -- Clear Highlights

map("n", "<C-p>", "<cmd>Telescope find_files<CR>")
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

map("n", "<Leader>rj", "<Plug>RestNvim")
map("n", "<Leader>rk", "<Plug>RestNvimPreviw")
map("n", "<Leader>rl", "<Plug>RestNvimLast")

-- Split resizing
map("n", "<C-w>>", "20<C-w>>")
map("n", "<C-w><", "20<C-w><")

-- surround
require("nvim-surround").setup({})

vim.api.nvim_create_user_command("DiagnosticToggle", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config {
		virtual_text = not vt,
		underline = not vt,
		signs = not vt,
	}
end, { desc = "toggle diagnostic" })

-- Use vim-dispatch or something to not have the buffer hang while we wait for execution.
-- The extra <CR> in the end is to skip the press enter to continue dialog.
vim.cmd("autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR><CR>")
vim.cmd("autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR><CR>")

