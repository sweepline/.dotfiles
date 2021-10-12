local action_set = require('telescope.actions.set')

require('telescope').setup {
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
