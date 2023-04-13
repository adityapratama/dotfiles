local theme = 'gruvbox' -- gruvbox-baby, catppuccin, kanagawa, tokyonight, rose-pine

local alacritty_term = os.getenv('ALACRITTY_TERM') or 'false'
if alacritty_term == 'true' then
  -- theme = 'catppuccin'
  -- theme = 'rose-pine'
  theme = 'tokyonight'
end

if theme == 'gruvbox-baby' then
  vim.g.gruvbox_baby_background_color = 'medium'
  vim.g.gruvbox_baby_function_style = "NONE"
  vim.g.gruvbox_baby_keyword_style = "NONE"
  vim.cmd [[set background=dark]]
  vim.cmd [[set termguicolors]]
  vim.cmd [[let g:gruvbox_contrast_light="hard"]]
  vim.cmd [[colorscheme gruvbox-baby]]
elseif theme == 'gruvbox' then
  vim.cmd [[set background=dark]]
  vim.cmd [[set termguicolors]]
  vim.cmd [[let g:gruvbox_contrast_light="hard"]]
  vim.cmd [[colorscheme gruvbox]]
elseif theme == 'tokyonight' then
  vim.cmd [[colorscheme tokyonight]]
elseif theme == 'catppuccin' then
  vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

  require("catppuccin").setup({
    -- transparent_background = true,
    styles = {
      comments = {},
      conditionals = {}
    },
    custom_highlights = {
      ["@parameter"] = { style = {} }
    }
  })
  vim.cmd [[colorscheme catppuccin]]
elseif theme == 'kanagawa' then
  require('kanagawa').setup({
      undercurl = true,           -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true},
      statementStyle = { bold = true },
      typeStyle = {},
      variablebuiltinStyle = { italic = true},
      specialReturn = true,       -- special highlight for the return keyword
      specialException = true,    -- special highlight for exception handling keywords
      transparent = true,        -- do not set background color
      dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
      globalStatus = false,       -- adjust window separators highlight for laststatus=3
      terminalColors = true,      -- define vim.g.terminal_color_{0,17}
      colors = {},
      overrides = {},
      theme = "default"           -- Load "default" theme or the experimental "light" theme
  })
  -- setup must be called before loading
  vim.cmd("colorscheme kanagawa")
elseif theme == 'rose-pine' then
  require('rose-pine').setup({
    dark_variant = 'main', -- moon, main
    disable_background = true,
    -- disable_float_background = true,
    disable_italics = true,
    -- groups = {
      -- background = 'surface'
    -- }
  })
  vim.cmd("colorscheme rose-pine")
end
