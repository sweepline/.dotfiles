-- Map leader to space
vim.g.mapleader = " "

-- Sensible defaults
require("settings")

-- Lazy nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load other configs
require("plugins")
require("keymappings")
require("ui")
require("lsp")
require("completion")
require("treesitter")
require("search")

require("nvim_comment").setup()

if vim.g.neovide then
  vim.o.guifont = "Iosevka Fixed Slab:h14"
  vim.g.neovide_padding_top = 8
  vim.g.neovide_padding_bottom = 8
  vim.g.neovide_padding_right = 8
  vim.g.neovide_padding_left = 8
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_cursor_animation_length = 0.10
  vim.g.neovide_cursor_trail_size = 0.3
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
end
