-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local indent = 4

vim.cmd("filetype plugin indent on")
vim.opt.tabstop = indent
vim.opt.shiftwidth = indent
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.opt.shiftround = true


-- Treesitter folding
vim.o.foldlevelstart = 20    -- start folded if more than 20
vim.wo.foldnestmax = 3
vim.wo.foldminlines = 5

vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 4
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
vim.cmd("au TextYankPost * lua vim.hl.on_yank {on_visual = false}")

-- Highlight trailing whitespace
vim.cmd(
	"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkred guibg=darkred")
vim.cmd([[autocmd InsertLeave * if expand('%') != '' | syn match ExtraWhitespace /\s\+$\| \+\ze\t/ | endif]])
vim.cmd("autocmd InsertEnter * syn clear ExtraWhitespace")

vim.filetype.add({ extension = { wgsl = "wgsl" } })

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.completeopt = "noinsert,noselect"
-- vim.cmd [[set shortmess+=c]]

