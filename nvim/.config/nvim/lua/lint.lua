local null_ls = require("null-ls")

-- Tons of useful linters i could use.
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md

null_ls.setup({
	sources = {
		null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.diagnostics.flake8,
		--null_ls.builtins.diagnostics.gdlint,
		--Something markdown
		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.diagnostics.stylelint,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.prettier,
	},
})
