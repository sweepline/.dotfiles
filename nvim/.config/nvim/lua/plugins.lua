return require("packer").startup(function()

	use { "wbthomason/packer.nvim", opt = true }


	-- LSP and coding things

	use { "williamboman/mason.nvim" }
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

	use {
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "kyazdani42/nvim-web-devicons" } }
	}

	use { "nvim-telescope/telescope-ui-select.nvim" }

	use { "neovim/nvim-lspconfig" }

	use { "hrsh7th/cmp-nvim-lsp" }
	use { "hrsh7th/cmp-buffer" }
	use { "hrsh7th/cmp-path" }
	use { "hrsh7th/cmp-cmdline" }
	use { "hrsh7th/nvim-cmp" }
	use { "hrsh7th/cmp-vsnip" }
	use { "hrsh7th/vim-vsnip" }

	-- Fluff

	use { "tikhomirov/vim-glsl" }

	use { "sainnhe/gruvbox-material" }
	-- use { "rose-pine/neovim" }

	use { "terrortylor/nvim-comment" }

	--use { "m4xshen/autoclose.nvim" }

	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit for the latest features
	})

	use {
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true }
	}

	use { "tpope/vim-fugitive" }
end)
