return require('packer').startup(function()

	use { 'wbthomason/packer.nvim', opt = true }

	-- LSP and coding things

	use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }

	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' }, { 'kyazdani42/nvim-web-devicons' } }
	}

	use { 'nvim-telescope/telescope-ui-select.nvim' }

	use { 'neovim/nvim-lspconfig' }

	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-path' }
	use { 'hrsh7th/cmp-cmdline' }
	use { 'hrsh7th/nvim-cmp' }

	use { 'hrsh7th/cmp-vsnip' }
	use { 'hrsh7th/vim-vsnip' }

	-- Fluff

	use { 'tikhomirov/vim-glsl' }

	use { "ellisonleao/gruvbox.nvim" }
	use { "glepnir/zephyr-nvim" }

	use { 'terrortylor/nvim-comment' }

	use {
		'hoob3rt/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use { 'tpope/vim-fugitive' }

	use { 'tidalcycles/vim-tidal' }

end)
