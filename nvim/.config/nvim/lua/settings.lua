-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local indent = 4

-- Enable filetype detection, filetype plugins, and filetype-based indentation
vim.cmd("filetype plugin indent on")
-- Tab character displays as 4 spaces wide
vim.opt.tabstop = indent
-- >> / << and auto-indent use 4 spaces
vim.opt.shiftwidth = indent
-- Tab/backspace in insert mode moves 4 spaces
vim.opt.softtabstop = indent
-- Insert real tab characters, not spaces
vim.opt.expandtab = false
-- Auto-indent new lines based on code structure
vim.opt.smartindent = true
-- Round indentation to nearest multiple of shiftwidth
vim.opt.shiftround = true


-- Treesitter folding
vim.o.foldlevelstart = 20    -- start folded if more than 20
vim.wo.foldnestmax = 3
vim.wo.foldminlines = 5

-- Allow switching buffers without saving
vim.opt.hidden = true
-- Case-insensitive search by default
vim.opt.ignorecase = true
-- Override ignorecase when search contains uppercase letters
vim.opt.smartcase = true
-- Keep 4 lines visible above/below cursor when scrolling
vim.opt.scrolloff = 4
-- Keep 8 columns visible left/right of cursor when scrolling
vim.opt.sidescrolloff = 8
-- Open horizontal splits below the current window
vim.opt.splitbelow = true
-- Open vertical splits to the right of the current window
vim.opt.splitright = true
-- Tab completion: list all matches and complete to longest common prefix
vim.opt.wildmode = "list:longest"
-- Show absolute line numbers
vim.wo.number = true
-- Disable relative line numbers
vim.wo.relativenumber = false
-- Highlight the line the cursor is on
vim.opt.cursorline = true

-- Show invisible characters
vim.opt.list = true
vim.opt.listchars = "tab:▷ ,trail:·,extends:◣,precedes:◢,nbsp:○"

-- Highlight yank
vim.cmd("au TextYankPost * lua vim.hl.on_yank {on_visual = false}")

vim.filetype.add({ extension = { wgsl = "wgsl" } })

-- Use 24-bit colors
vim.opt.termguicolors = true
-- Dark mode
vim.opt.background = "dark"
