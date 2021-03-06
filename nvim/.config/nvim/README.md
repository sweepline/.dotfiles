# Nvim config

When on a fresh start you must enable different things manually after copying the config.

## Packer
Should do `:PackerSync` and `:PackerInstall`.

## Treesitter
`:TSUpdate all`

## LSP
You must install the LSP servers you need. More info on that in `nvim-lspconfig` [server_configurations.md](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).

In `lsp.lua`, there is also the EFM languageserver which is what runs linters and formatter, these dependencies also needs to be installed.

Alternatively you could use the github package `kabouzeid/nvim-lspinstall`.

## Telescope
[Telescope](https://github.com/nvim-telescope/telescope.nvim) has a couple of dependencies and many config options.
