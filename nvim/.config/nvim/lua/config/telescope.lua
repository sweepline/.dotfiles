local action_set = require('telescope.actions.set')

require('telescope').setup {
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown {
				-- even more opts
			}

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
	},
	-- This is a workaround for folds not working
	pickers = {
		find_files = {
			hidden = true,
			attach_mappings = function(prompt_bufnr)
				action_set.select:enhance({
					post = function() vim.cmd(":normal! zx") end
				})
				return true
			end
		}
	}
}

-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
