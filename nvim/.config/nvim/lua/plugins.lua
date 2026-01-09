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
			"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons"
		}
	},
	"nvim-telescope/telescope-ui-select.nvim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		keys = {
			{ "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
			{ "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
			{ "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
			{ "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
		},
	},

	"onsails/lspkind.nvim",
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-calc',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-vsnip',
	'hrsh7th/vim-vsnip',
	{
		"David-Kunz/cmp-npm",
		dependencies = { 'nvim-lua/plenary.nvim' },
		ft = "json",
		lazy = true,
	},
	{
		'saecki/crates.nvim',
		tag = 'stable',
		dependencies = { 'nvim-lua/plenary.nvim' },
		lazy = true,
	},
	{
		'mfussenegger/nvim-dap',
		lazy = true
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
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},
	'AndreM222/copilot-lualine',
	"tpope/vim-fugitive",
	"tpope/vim-sleuth",

	-- Color schemes
	"sainnhe/gruvbox-material",
	"rose-pine/neovim",

	-- Github Copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
	},
	{
		"zbirenbaum/copilot-cmp",
	}
})
