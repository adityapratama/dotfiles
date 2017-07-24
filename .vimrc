" set line number
set number
" set clipboard=unnamed
if $TMUX == ''
  set clipboard+=unnamed
endif
" size of a hard tabstop
" set tabstop=2

" http://vi.stackexchange.com/a/21
set backspace=indent,eol,start

" size of an "indent"
set shiftwidth=2
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
" set softtabstop=2
set tabstop=2
set expandtab
set autoindent
set autowrite

" VUNDLE
set nocompatible              " be iMproved, required
filetype on
" filetype off                  " required
filetype plugin indent on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line

Plugin 'https://github.com/scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Chiel92/vim-autoformat'
Plugin 'mileszs/ack.vim'

call vundle#end()            " required

" Vim-ariline
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='simple'
" End of Vim-airline

syntax enable
set background=dark
" http://www.terminally-incoherent.com/blog/2012/10/17/vim-solarized-and-tmux/
set t_Co=256  " force vim to use 256 colors
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_degrade=1
" colorscheme solarized
colorscheme molokai
let g:ctrlp_map = '<c-p>'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_mri_quiet_messages = { 'regex': 'assigned but unused variabl' }

" let g:syntastic_c_checkers=['make','splint']

" au VimEnter *  NERDTree

" VIM-GO Setting
let mapleader = ","
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

let g:go_fmt_command = "goimports"
" END VIM-GO Setting


" Ack setting
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" End of Ack setting

" CtrlP setting
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

" CtrlP setting
" https://github.com/kien/ctrlp.vim/issues/58#issuecomment-92137249
let g:ctrlp_user_command = 'find %s -type f | grep -v "`cat ~/.vim/.ctrlpignore`"'
" let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|public)|(\.(swp|ico|git|svn|jpg|jpeg|png|gif|bmp))$'
" End of CtrlP setting
