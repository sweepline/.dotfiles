local lualine = require('lualine')
lualine.setup {
    options = {
        theme = custom_gruvbox,
        -- section_separators = {'', ''},
        -- component_separators = {'', ''},
        section_separators = '',
        component_separators = ''
    },
    sections = {lualine_c = {{'filename', file_status = true, path = 1}}}
}
