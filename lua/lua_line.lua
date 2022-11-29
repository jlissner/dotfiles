require('lualine').setup({
  sections = {
    lualine_a = {{'filename', path = 1 }},
    lualine_b = { 'branch' },
    lualine_c = { 'diff' },
    lualine_x = {},
    lualine_y = {'encoding', 'fileformat', 'filetype'},
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})
