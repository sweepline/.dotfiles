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
