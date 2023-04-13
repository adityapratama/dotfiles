require 'cmp_config'

function theme_plugins()
  local alacritty_term = os.getenv('ALACRITTY_TERM') or 'false'

  if alacritty_term == 'true' then

    -- return { 'catppuccin/nvim', name = 'catppuccin' }
    -- return { 'rose-pine/neovim', name = 'rose-pine' }
    return { 'folke/tokyonight.nvim', branch = 'main' }
  end

  return { { dir = '~/.nvim/plugged/gruvbox' } }
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup(vim.tbl_deep_extend('force', {
  -- 'wbthomnameon/packer.nvim',

  -- Tpope
  {'tpope/vim-dispatch', lazy = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}},
  'tpope/vim-surround',
  'tpope/vim-endwise',
  'tpope/vim-abolish',
  { 'tpope/vim-fireplace', ft= 'clojure' },
  'tpope/vim-fugitive',

  -- LSP
  'neovim/nvim-lspconfig',
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = cmp_config
  },


  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-telescope/telescope-fzy-native.nvim',
      'nvim-telescope/telescope-fzf-writer.nvim',
      -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    cmd = { 'Telescope' },
    config = function()
      local actions = require('telescope.actions')

      require('telescope').setup {
        defaults = {
        layout_strategy = 'vertical',
        layout_config = { height = 0.93, width = 0.7 },
        mappings = {
            i = {
              ["<esc>"] = actions.close
            }
          }
        },
        -- pickers = {
          -- find_files = {
            -- theme = "dropdown",
          -- }
        -- },
        extensions = {
          fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
          },
        }
      }

      require('telescope').load_extension('fzy_native')
    end
  },
  'kyazdani42/nvim-web-devicons',

  -- Editor
  'christoomey/vim-tmux-navigator',
  { 'preservim/nerdcommenter', lazy = false },
  'mileszs/ack.vim',
  { 'junegunn/fzf', dir = '~/.fzf', build = 'fzf#install()' },
  'junegunn/fzf.vim',
  'Yggdroot/indentLine',
  'raimondi/delimitmate',
  'AndrewRadev/splitjoin.vim',
  'phaazon/hop.nvim',
  'kyazdani42/nvim-tree.lua',
  'rcarriga/nvim-notify',
  { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true } },

  -- Themes
  -- { dir = '~/.nvim/plugged/gruvbox' },
  -- 'gruvbox-community/gruvbox',
  -- 'tanvirtin/monokai.nvim',
  -- { 'luisiacc/gruvbox-baby', branch = 'main' },
  -- { 'catppuccin/nvim', name = 'catppuccin' },
  -- 'rebelot/kanagawa.nvim',
  -- 'rose-pine/neovim', name = 'rose-pine',

  -- Golang
  { 'fatih/vim-go', version = '*' },

  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'nvim-treesitter/nvim-treesitter-refactor',
  'nvim-treesitter/playground',

  { dir = '~/.vim/plugged/vim-secret' },
  -- { dir = '~/.nvim/plugged/my-markdown' },
  { dir = '~/.nvim/plugged/myindentline.vim' },

  { 'dstein64/vim-startuptime', cmd = "StartupTime" },
}, theme_plugins()))
