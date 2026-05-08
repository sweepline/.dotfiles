return {
	{
		"mason-org/mason.nvim",
		opts = {}
	},
	{
		"mason-org/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				-- HTML/CSS/JS/TS/JSX/TSX
				"html",
				"cssls",
				"cssmodules_ls",
				"ts_ls",
				"eslint",
				"efm", --prettier
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
		'creativenull/efmls-configs-nvim',
		version = 'v1.x.x',                   -- version is optional, but recommended
		dependencies = { 'neovim/nvim-lspconfig' }, -- not required if using nvim >= 0.11
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

			local prettier = require('efmls-configs.formatters.prettier')
			local stylelint = require('efmls-configs.linters.stylelint')
			local languages = {
				scss = { prettier, stylelint },
			}
			local efmls_config = {
				filetypes = vim.tbl_keys(languages),
				settings = {
					rootMarkers = { '.git/' },
					languages = languages,
				},
				init_options = {
					documentFormatting = true,
					documentRangeFormatting = true,
				},
			}
			vim.lsp.config('efm', vim.tbl_extend('force', efmls_config, {
				cmd = { 'efm-langserver' },
				capabilities = capabilities,
			}))

			vim.lsp.config("basedpyright", {
				capabilities = vim.tbl_extend('force', capabilities, { general = { positionEncodings = { "utf-16" } } }),
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
		end,
		keys = {
			{ "]e", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, desc = "Go to next error" },
			{ "[e", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, desc = "Go to previous error" },
			{
				"<leader><Tab>",
				function()
					local allowed = { biome = true, efm = true, lua_ls = true, rust_analyzer = true, ruff = true }
					local formatter = nil
					local start = vim.uv.hrtime()
					vim.lsp.buf.format({
						async = false,
						filter = function(client)
							if allowed[client.name] then
								formatter = client.name
								return true
							end
						end,
						timeout_ms = 2000,
					})
					if formatter then
						local ms = math.floor((vim.uv.hrtime() - start) / 1e6)
						vim.notify(string.format("Formatted with %s (%dms)", formatter, ms))
					end
					-- There is already an output when no formatter is found, so dont notify for that.
				end,
				desc = "Format document with LSP",
			},
		}
	}
}
