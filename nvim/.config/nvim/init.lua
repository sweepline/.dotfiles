-- Map leader to space
vim.g.mapleader = " "

local fn = vim.fn
local execute = vim.api.nvim_command

-- Sensible defaults
require("settings")

-- Packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		"git", "clone", "https://github.com/wbthomason/packer.nvim",
		install_path
	})
	execute "packadd packer.nvim"
end

vim.cmd("packadd packer.nvim")
-- Auto compile when there are changes in plugins.lua
-- vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])
vim.cmd("autocmd BufWritePost plugins.lua PackerCompile") -- Auto compile when there are changes in plugins.lua

-- Load other configs
require("plugins")
require("keymappings")
require("ui")
require("lsp")
require("completion")
require("treesitter")
require("search")

require("nvim_comment").setup()
