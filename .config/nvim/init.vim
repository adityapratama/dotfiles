if $tmux == ''
  set clipboard+=unnamed
endif
set backspace=indent,eol,start
set relativenumber
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set autowrite

" specify a directory for plugins
" - for neovim: ~/.local/share/nvim/plugged
" - avoid using standard vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" make sure you use single quotes

" shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" any valid git url is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" multiple plug commands can be written in a single line using | separators
" plug 'sirver/ultisnips' | plug 'honza/vim-snippets'

" on-demand loading
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" plugin for golang
Plug 'fatih/vim-go', { 'tag': '*' }

" autocomplete
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'Shougo/deoplete.nvim', { 'do': ':updateremoteplugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

" plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'

" File Search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'

" Vim Theme
Plug 'Chiel92/vim-autoformat' 
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'

call plug#end()

" Vim Theme
syntax enable
set background=dark
" http://www.terminally-incoherent.com/blog/2012/10/17/vim-solarized-and-tmux/
set t_Co=256  " force vim to use 256 colors
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_degrade=1
colorscheme molokai
" End of Vim Them

" Vim-ariline
let g:airline_powerline_fonts=1
let g:airline_theme='simple'
set laststatus=2
" End of Vim-airline

" VIM-GO Setting
let mapleader = ","
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_fmt_command = "goimports"
" END VIM-GO Setting

" CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" End of CtrlP

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space><Paste>
" End of Ack

" Deoplete
let g:deoplete#enable_at_startup=1
" End of Deoplete