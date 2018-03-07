" * goes to the next matching word
" # goes to the previous matching word
set backspace=indent,eol,start
set relativenumber number
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set autowrite
" https://stackoverflow.com/questions/15962421/how-can-i-disable-scratch-preview-window
set completeopt-=preview

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
" How to move
" Ctrl+N : down, Ctrl+P : up
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':updateremoteplugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-clang'
" Typescript
" Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript'

" plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'christoomey/vim-tmux-navigator'

" Vim Theme
Plug 'Chiel92/vim-autoformat' 
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'

" Rudy and Rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" Elixir
" https://github.com/kbrw/elixir.nvim
Plug 'elixir-lang/vim-elixir'
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
" Plug 'thinca/vim-ref'

" Javascript
" https://github.com/carlitux/deoplete-ternjs
" create file ~/.tern-project  after :PlugInstall
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

Plug 'junegunn/rainbow_parentheses.vim'
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

" Neomake
" To open and close manually error window
" :lopen, :lclose, :copen, cclose
autocmd! BufWritePost * Neomake
" Open error window
" let g:neomake_open_list = 2
" Enf of Neomake

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

" Nerdcommenter
let g:NERDSpaceDelims = 1
" End of Nerdcommenter

" NERDTree
map <silent> <C-k>b :NERDTreeToggle<CR>
" NERDTree end

let g:deoplete#sources#clang#libclang_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang'
