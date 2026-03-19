return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		version = false, -- last release is way too old and doesn't work on Windows
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter")

			-- Enable Treesitter highligh to all filetypes that there are parsers for.
			vim.api.nvim_create_autocmd('FileType', {
				callback = function(args)
					if
					-- is arg2 in arg1
						vim.list_contains(
						-- all installed parsers
							treesitter.get_installed(),
							-- get parser for current language
							vim.treesitter.language.get_lang(args.match)
						)
					then
						vim.treesitter.start(args.buf)
						vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
						vim.wo.foldmethod = 'expr'
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		init = function()
			-- Disable entire built-in ftplugin mappings to avoid conflicts.
			-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
			vim.g.no_plugin_maps = true

			-- Or, disable per filetype (add as you like)
			-- vim.g.no_python_maps = true
			-- vim.g.no_ruby_maps = true
			-- vim.g.no_rust_maps = true
			-- vim.g.no_go_maps = true
		end,
		config = function()
			-- put your config here
		end,
	}
}
