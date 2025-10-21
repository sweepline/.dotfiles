return require("lazy").setup({
	{
		"m4xshen/hardtime.nvim",
		lazy = false,
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {},
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
		cmd = "Neogit"
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons"
		}
	},
	"nvim-telescope/telescope-ui-select.nvim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-vsnip',
	'hrsh7th/vim-vsnip',
	{
		'mfussenegger/nvim-dap',
		lazy = true
	},
	{
		'saecki/crates.nvim',
		tag = 'stable',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('crates').setup()
		end,
		lazy = true,
	},
	"tikhomirov/vim-glsl",
	"terrortylor/nvim-comment",
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	},
	{
		"hoob3rt/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" }
	},
	"tpope/vim-fugitive",
	"tpope/vim-sleuth",

	-- Color schemes
	"sainnhe/gruvbox-material",
	"rose-pine/neovim",
})
