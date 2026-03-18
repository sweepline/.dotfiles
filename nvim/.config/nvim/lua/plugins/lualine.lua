return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				theme = "gruvbox-material",
				-- component_separators = { left = '', right = '' },
				-- section_separators = { left = '', right = '' },
				-- section_separators = {"", ""},
				-- component_separators = {"", ""},
				section_separators = "",
				component_separators = "|"
			},
			sections = {
				lualine_c = {
					{ "filename", file_status = true, newfile_status = true, path = 1 },
				},
				lualine_x = { 'copilot', 'encoding', 'fileformat', 'filetype' }, -- copilot added to default
			},
			winbar = {
				lualine_c = {
					{
						"navic",
						navic_opts = {
							highlight = true,
						}
					}
				},
				lualine_x = {
					'lsp_status',
				}
			}
		}
	},
	{
		"SmiteshP/nvim-navic",
		dependencies = { "neovim/nvim-lspconfig" },
	},
	-- 'AndreM222/copilot-lualine',
}
