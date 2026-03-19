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
					local allowed = { biome = true, ["null-ls"] = true, lua_ls = true, rust_analyzer = true, ruff = true }
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
		},
	},
}
