require 'default'
require 'globals'
-- require 'plugins'
require 'lazy_plugins'
require 'theme'
-- require 'telescope_config'
require 'lsp_config'
-- require 'cmp_config'
require 'treesitter_config'
require 'gitcmd'
require 'hop_keymaps'
-- nvim-tree
require("nvim-tree").setup()
require 'keymaps'
require 'custom_augroup'
require 'custom_command'
-- require 'statusline_config'
require 'lualine_config'
require 'auto_noh'

-- vim.api.nvim_create_user_command('RRun', 'tmux send-keys -t "1" "ls" Enter', { bang = true })
