local putils = require("telescope.previewers.utils")

require('telescope').setup {
	defaults = {
		layout_strategy = "flex",
		layout_config = {},
		path_display = { "smart" },
		dynamic_preview_title = true,
		mappings = {
			n = {
				['<c-d>'] = require('telescope.actions').delete_buffer,
			},
		},
		preview = {
			filetype_hook = function(filepath, bufnr, opts)
				-- you could analogously check opts.ft for filetypes
				local excluded = vim.tbl_filter(function(ending)
					return filepath:match(ending)
				end, {
					".*emscripten.*.js",
					".*.csv",
					".*%.toml",
				})
				if not vim.tbl_isempty(excluded) then
					putils.set_preview_message(
						bufnr,
						opts.winid,
						string.format("`%s` not shown for performance reasons.",
							excluded[1])
					)
					return false
				end
				return true
			end,
		}
	},
	pickers = {
		live_grep = {
			layout_strategy = "vertical",
		},

	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown {},

			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)
			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }
		}
	}
}

-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
