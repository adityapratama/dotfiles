local theme = 'gruvbox' -- 'catppuccin'

local alacritty_term = os.getenv('ALACRITTY_TERM') or 'false'
if alacritty_term == 'true' then
  theme = 'catppuccin'
  -- theme = 'rose-pine'
  -- theme = 'tokyonight'
end

require('lualine').setup({
  options = {
    theme = theme,
    -- component_separators = { left = ' ', right = ' '},
    -- section_separators = { left = ' ', right = ' ' },
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  }
})
