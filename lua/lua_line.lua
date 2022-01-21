local function window()
  return 'Window ' .. vim.api.nvim_win_get_number(0)
end

local function bufferNum()
  return 'Buffer ' .. vim.api.nvim_win_get_buf(0)
end

require('lualine').setup({
  sections = {
    lualine_a = {'mode'},
    lualine_b = {{'filename', path = 1 }},
    lualine_c = {'branch', 'diff'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { window },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { window },
  },
})
