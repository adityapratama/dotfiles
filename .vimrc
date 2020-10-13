" VIM setting {{{
" set line number
set hlsearch
set relativenumber number
set cursorline
" http://vi.stackexchange.com/a/21
set backspace=indent,eol,start
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set autowrite
" https://www.reddit.com/r/vim/comments/2391u5/delay_while_using_esc_to_exit_insert_mode/
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000
set nocompatible              " be iMproved, required

" https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

filetype on
filetype plugin indent on
" }}}

" TMUX setting {{{
if $TMUX == ''
  set clipboard+=unnamed
endif
" }}}

call plug#begin('~/.vim/plugged')
" Plug Editor {{{
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Chiel92/vim-autoformat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'thinca/vim-quickrun'
" Plug 'mileszs/ack.vim'
" }}}

" Plug Git {{{
Plug 'tpope/vim-fugitive'
" }}}

" Plug Autocomplete {{{
" https://octetz.com/posts/vim-as-go-ide
" Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" }}}

" Plug Theme {{{
" Plug 'haishanh/night-owl.vim'
" Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
" Plug 'rakr/vim-one'
" }}}

" Plug Language {{{
Plug 'fatih/vim-go'
Plug 'elmcast/elm-vim'
" }}}

" Plug Rails {{{
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
" }}}

" Plug My Custom Plugins {{{
Plug '~/.vim/plugged/potion'
Plug '~/.vim/plugged/vim-secret'
" }}}
call plug#end()

" Remap clipboard copy/paste
noremap <C-y> "*y

" Airline Setting {{{
let g:airline_powerline_fonts = 1
set laststatus=2
" let g:airline_theme='simple'
let g:airline_theme='gruvbox'
" let g:airline_theme='one'
" let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
" }}}

" Theme setting {{{
set background=dark
" set background=light
if (has("termguicolors"))
  " Importand for vim 8!
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
syntax enable
" colorscheme night-owl
" colorscheme molokai
colorscheme gruvbox
" colorscheme one
" }}}

" Vim Global setting {{{
let mapleader = ","
let maplocalleader = "_"
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
" }}}

" VIM-GO Setting {{{
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  :GoAddTags<CR>
autocmd FileType go nmap <leader>rt  :GoRemoveTags<CR>
autocmd FileType go nmap <leader>gi  :GoImports<CR>
autocmd FileType go nmap <leader>ga  :GoAlternate<CR>
autocmd FileType go nmap <leader>gd  :GoDecls<CR>
autocmd FileType go nmap <leader>ggd  :GoDeclsDir<CR>
" let g:go_fmt_command = "goimports"
" let g:go_def_mode = 'godef' "https://github.com/fatih/vim-go/issues/1877#issuecomment-405507049
" disable vim-go :GoDef short cut (gd)
" " this is handled by LanguageClient [LC]
let g:go_fmt_command = "gofmt"
let g:go_rename_command = "gopls"
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
let g:go_decls_includes = "func,type"
let g:go_list_type = "quickfix"
" let g:go_auto_sameids = 1
" }}}

" COC Setting {{{
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" }}}

" Fzf setting {{{
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>p :Buffers<CR>
nnoremap <leader>a :Rg<Space>
nnoremap <expr> <leader>A ':Rg '.expand('<cword>')
" https://www.erickpatrick.net/blog/adding-syntax-highlighting-to-fzf.vim-preview-window
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
" }}}

" NERDTree setting {{{
map <silent> <Leader>kb :NERDTreeToggle<CR>
" }}}

" Nerdcommenter Setting {{{
let g:NERDSpaceDelims = 1
" }}}

" ALE Setting {{{
" https://hackernoon.com/my-neovim-setup-for-go-7f7b6e805876
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠' " Enable integration with airline.
let g:airline#extensions#ale#enabled = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
" }}}

packloadall
silent! helptags ALL

" noremap <Leader>e64 :s/\(\w\+.*\): \(\w\+.*\)/\=substitute(substitute(submatch(1).": ".submatch(2),submatch(2), system('base64', submatch(2)), ""), "\n", "", "")<CR>:nohlsearch<CR>
" noremap <Leader>d64 :s/\(\w\+.*\): \(\w\+.*\)/\=substitute(substitute(submatch(1).": ".submatch(2), submatch(2), system('base64 --decode', submatch(2)), ""), "\n", "","")<CR>:nohlsearch<CR>


" Quickrun setting {{{
let b:quickrun_config = {'outputter': 'popup'}
" }}}

" Ident setting {{{
" set list lcs=tab:\|\ 
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" }}}

" JSON formater {{{
" https://coderwall.com/p/faceag/format-json-in-vim
autocmd FileType json nmap <leader>jf :%!python3 -m json.tool<CR>
" https://til.hashrocket.com/posts/ha0ci0pvkj-format-json-in-vim-with-jq
autocmd FileType json nmap <leader>jq :%!jq 
" }}}

function Pods()
  :%! kubectl get pods
endfunction

function PodsTerminateThis()
  execute "%! kubectl delete pods ".split(getline('.'), ' ')[0]
  " execute "%! kubectl describe pods ".split(getline('.'), ' ')[0]
  :%! kubectl get pods
  " echo split(getline('.'), ' ')[0]
endfunction
