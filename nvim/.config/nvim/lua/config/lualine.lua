local lualine = require('lualine')
lualine.setup {
    options = {
        theme = gruvbox_material,
        -- section_separators = {'', ''},
        -- component_separators = {'', ''},
        section_separators = '',
        component_separators = ''
    },
    sections = {lualine_c = {{'filename', file_status = true, path = 1}}}
}
