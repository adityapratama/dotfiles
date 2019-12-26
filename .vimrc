" set line number
set relativenumber number
set cursorline
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
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
call plug#begin('~/.vim/plugged')

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plug 'L9'
" Git plugin not hosted on GitHub
" Plug 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line

" Plug 'https://github.com/scrooloose/syntastic'
" Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'fatih/vim-go'
" https://octetz.com/posts/vim-as-go-ide
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'dense-analysis/ale'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Chiel92/vim-autoformat'
Plug 'mileszs/ack.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'haishanh/night-owl.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdcommenter'
call plug#end()
" call vundle#end()            " required

" Vim-ariline
let g:airline_powerline_fonts = 1
set laststatus=2
" let g:airline_theme='simple'
let g:airline_theme='night_owl'
let g:airline#extensions#tabline#enabled = 1
" End of Vim-airline

" set background=dark
" http://www.terminally-incoherent.com/blog/2012/10/17/vim-solarized-and-tmux/
" set t_Co=256  " force vim to use 256 colors
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" let g:solarized_degrade=1
" colorscheme solarized
" colorscheme molokai
if (has("termguicolors"))
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
syntax enable
colorscheme night-owl
let g:ctrlp_map = '<c-p>'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_ruby_mri_quiet_messages = { 'regex': 'assigned but unused variabl' }

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
" let g:go_def_mode = 'godef' "https://github.com/fatih/vim-go/issues/1877#issuecomment-405507049
" disable vim-go :GoDef short cut (gd)
" " this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
let g:go_addtags_transform = "snakecase"
" https://hackernoon.com/my-neovim-setup-for-go-7f7b6e805876
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
" let g:go_auto_sameids = 1
" END VIM-GO Setting

" COC
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" END COC

" Ack setting
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
" End of Ack setting

" Fzf
nnoremap <Leader>f :FZF<CR>
" End of Fzf

" NERDTree
map <silent> <C-k>b :NERDTreeToggle<CR>
" NERDTree end

" CtrlP setting
nnoremap <Leader>p :CtrlPBuffer<CR>
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

" CtrlP setting
" https://github.com/kien/ctrlp.vim/issues/58#issuecomment-92137249
let g:ctrlp_user_command = 'find %s -type f | grep -v "`cat ~/.vim/.ctrlpignore`"'
" let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|public)|(\.(swp|ico|git|svn|jpg|jpeg|png|gif|bmp))$'
" End of CtrlP settinga

" Nerdcommenter
let g:NERDSpaceDelims = 1
" End of Nerdcommenter

" ALE
" https://hackernoon.com/my-neovim-setup-for-go-7f7b6e805876
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠' " Enable integration with airline.
let g:airline#extensions#ale#enabled = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
" ALE END
