return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				theme = "gruvbox-material",
				-- component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				-- section_separators = { left = "", right = "" },
				-- component_separators = { left = "", right = "" },
				-- section_separators = "",
				component_separators = "|"
			},
			sections = {
				lualine_c = {
					{ "filename", file_status = true, newfile_status = true, path = 1 },
				},
				lualine_x = {
					'encoding',
					'fileformat',
					'filetype'
				},
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
					{
						function()
							return ""
						end,
						color = function()
							local status = require("sidekick.status").get()
							if status then
								return status.kind == "Error" and
									"DiagnosticError" or
									status.busy and
									"DiagnosticWarn" or
									"Special"
							end
						end,
						cond = function()
							local status = require("sidekick.status")
							return status.get() ~= nil
						end,
					},
					{
						function()
							local status = require("sidekick.status").cli()
							return "" .. (#status > 1 and #status or "")
						end,
						cond = function()
							return #require("sidekick.status").cli() > 0
						end,
						color = function()
							return "Special"
						end,
					},
					'lsp_status',
				}
			}
		}
	},
	{
		"SmiteshP/nvim-navic",
		dependencies = { "neovim/nvim-lspconfig" },
		event = "LspAttach",
		config = function()
			local navic = require("nvim-navic")
			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					if client.server_capabilities.documentSymbolProvider then
						navic.attach(client, ev.buf)
					end
				end,
			})
		end
	},
}
