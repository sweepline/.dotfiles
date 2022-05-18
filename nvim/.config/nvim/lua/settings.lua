local indent = 4

vim.cmd("filetype plugin indent on")
vim.opt.expandtab = false
vim.opt.shiftwidth = indent
vim.opt.smartindent = true
vim.opt.tabstop = indent
vim.opt.shiftround = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 8
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmode = "list:longest"
vim.opt.cursorline = false
vim.wo.number = true
vim.wo.relativenumber = false
vim.opt.cursorline = true

vim.opt.listchars = "tab:▷ ,trail:·,extends:◣,precedes:◢,nbsp:○"

-- close buffer without closing window
vim.cmd("command BD b#|bd#")

-- Highlight yank
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = false}")

vim.cmd("au BufRead /home/mikkel/repos/mono/**.py setlocal sw=4 ts=4 sts=4 noet")

-- Highlight trailing whitespace
vim.cmd(
    "autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkred guibg=darkred")
vim.cmd([[autocmd InsertLeave * syn match ExtraWhitespace /\s\+$\| \+\ze\t/]])
vim.cmd("autocmd InsertEnter * syn clear ExtraWhitespace")

vim.g.tidal_target = "terminal"

