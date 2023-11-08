local null_ls = require("null-ls")

-- Tons of useful linters i could use.
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md

null_ls.setup({
	sources = {
		-- TS
		null_ls.builtins.code_actions.eslint,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.formatting.eslint,
		null_ls.builtins.formatting.prettier,

		-- Python
		null_ls.builtins.diagnostics.mypy,
		-- null_ls.builtins.diagnostics.ruff,
		-- null_ls.builtins.formatting.ruff,
		-- null_ls.builtins.formatting.ruff_format,

		--null_ls.builtins.diagnostics.gdlint,
		--Something markdown

		-- CSS
		null_ls.builtins.diagnostics.stylelint,
		null_ls.builtins.formatting.stylelint,

	},
})
