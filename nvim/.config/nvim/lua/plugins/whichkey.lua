return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
			{
				"<leader><Tab>",
				function()
					vim.lsp.buf.format({
						async = false,
						filter = function(client)
							-- apply whatever logic you want (in this example, we'll only use null-ls)
							return client.name == "biome" or client.name == "null-ls" or client.name == "lua_ls" or
								client.name == "rust_analyzer" or client.name == "ruff"
						end,
						timeout_ms = 2000,
					})
				end,
				desc = "Format document with LSP",
			},
		},
	},
}
