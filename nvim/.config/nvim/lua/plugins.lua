return require('packer').startup(function()

    use {'wbthomason/packer.nvim', opt = true}

    use {'sainnhe/gruvbox-material'}

    use {'mg979/vim-visual-multi'}

    use {'terrortylor/nvim-comment'}

    use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}

    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'},
            {'kyazdani42/nvim-web-devicons'}
        }
    }

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use {'neovim/nvim-lspconfig'}

    use {'glepnir/lspsaga.nvim'}

    use {'nvim-lua/completion-nvim'}

    use {'tpope/vim-fugitive'}

end)
