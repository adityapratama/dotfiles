-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup({ function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Tpope
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-endwise' }
  use { 'tpope/vim-abolish' }
  use { 'tpope/vim-fireplace', ft= 'clojure' }
  use { 'tpope/vim-fugitive' }

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }


  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-fzy-native.nvim' }
  use { 'nvim-telescope/telescope-fzf-writer.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'kyazdani42/nvim-web-devicons' }

  -- Editor
  use { 'christoomey/vim-tmux-navigator' }
  use { 'scrooloose/nerdcommenter' }
  use { 'mileszs/ack.vim' }
  use { 'junegunn/fzf', dir = '~/.fzf', run = 'fzf#install()' }
  use { 'junegunn/fzf.vim' }
  use { 'Yggdroot/indentLine' }
  use { 'raimondi/delimitmate' }
  use { 'AndrewRadev/splitjoin.vim' }
  use { 'phaazon/hop.nvim' }
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'rcarriga/nvim-notify' }

  -- Themes
  use { 'gruvbox-community/gruvbox' }
  use { 'tanvirtin/monokai.nvim' }
  -- use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'folke/tokyonight.nvim', branch = 'main' }
  use { 'rebelot/kanagawa.nvim' }

  -- Golang
  use { 'fatih/vim-go', tag = '*' }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/nvim-treesitter-refactor' }
  use { 'nvim-treesitter/playground' }

  use { '~/.vim/plugged/vim-secret' }
  use { '~/.nvim/plugged/my-markdown' }
  use { '~/.nvim/plugged/myindentline.vim' }

  use { 'dstein64/vim-startuptime' }
end,
config = {
   display = {
    open_fn = require('packer.util').float,
  }
}})
