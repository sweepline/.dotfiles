return {
	{
		"mason-org/mason.nvim",
		opts = {}
	},
	{
		"mason-org/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim"
		},
		opts = {
			ensure_installed = {
				-- HTML/CSS/JS/TS/JSX/TSX
				"html",
				"cssls",
				"cssmodules_ls",
				"ts_ls",
				"eslint",
				"stylelint_lsp",
				"biome@2.4.6",

				-- Python
				"basedpyright",
				"ruff",

				-- Rust
				"rust_analyzer",

				-- Other
				"lua_ls",
				"clangd",
				"sqlls",
				"dockerls",
				"docker_compose_language_service",
				"wgsl_analyzer",
				"copilot",
			}
		}
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = {
				-- Tooling (not lsp)
				"tree-sitter-cli",
			}
		}
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			capabilities = vim.tbl_deep_extend('force', capabilities,
				require('blink.cmp').get_lsp_capabilities({}, false))

			capabilities = vim.tbl_deep_extend('force', capabilities, {
				textDocument = {
					foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true
					}
				}
			})

			-- Show which linter is reporting the error.
			vim.diagnostic.config({
				virtual_text = {
					source = "always", -- Or "if_many"
				},
				float = {
					source = "always", -- Or "if_many"
				},
			})


			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.lsp.config("stylelint_lsp", {
				filetypes = { "css", "less", "scss", "sugarss", "vue", "wxss" }
			})
			vim.lsp.config("basedpyright", {
				capabilities = vim.tbl_extend('force', capabilities, { general = { positionEncodings = { "utf-16" } } }),
				settings = {
					basedpyright = {
						analysis = {
							diagnosticSeverityOverrides = {
								reportExplicitAny = false,
								reportMissingTypeStubs = false,
								reportUnusedCallResult = false,
								reportUnknownMemberType = false,
								reportUnknownArgumentType = false,
							}
						}
					}
				}
			})
			vim.lsp.config("biome", {
				capabilities = vim.tbl_extend('force', capabilities, { general = { positionEncodings = { "utf-16" } } }),
			})
			vim.lsp.config("rust_analyzer", {
				capabilities = vim.tbl_extend('force', capabilities, { general = { positionEncodings = { "utf-16" } } }),
			})
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = { diagnostics = { globals = { "vim", "use" } } } }
			})
			vim.lsp.config("clangd", {
				settings = {
					offsetEncoding = "utf-16",
				}
			})
			vim.lsp.config("copilot", {
				settings = {
					telemetry = {
						telemetryLevel = "all"
					}
				}
			})
		end
	}
}
