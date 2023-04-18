return require("packer").startup(function()
	use { "wbthomason/packer.nvim", opt = true }

	-- LSP and coding things

	-- Semantic highlight and symbols
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

	-- Popup window for file search and stuff
	use {
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "kyazdani42/nvim-web-devicons" } }
	}
	use { "nvim-telescope/telescope-ui-select.nvim" }

	-- LSP config and installer
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}

	-- Debug Adapter protocol
	use { 'mfussenegger/nvim-dap' }

	-- Autocomplete
	use {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-vsnip',
		'hrsh7th/vim-vsnip',
	}

	-- Lint and formatting
	use { "jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	}

	-- HTTP Requests
	use {
		"rest-nvim/rest.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	}

	-- Cargo.toml version highlight
	use {
		'saecki/crates.nvim',
		event = { "BufRead Cargo.toml" },
		requires = { { 'nvim-lua/plenary.nvim' } },
		config = function()
			require('crates').setup()
		end,
	}

	-- glsl highlight
	use { "tikhomirov/vim-glsl" }

	-- Auto comment
	use { "terrortylor/nvim-comment" }

	-- Surround stuff
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit for the latest features
	})

	-- Bar
	use {
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true }
	}

	-- Git
	use { "tpope/vim-fugitive" }

	-- Color schemes
	use { "sainnhe/gruvbox-material" }
	use { "rose-pine/neovim" }
end)
