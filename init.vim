" Vim {{{
set backspace=indent,eol,start
set relativenumber number
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set autowrite
" https://stackoverflow.com/questions/15962421/how-can-i-disable-scratch-preview-window
set completeopt-=preview
set cursorline
set colorcolumn=100
" }}}

" specify a directory for plugins
" - for neovim: ~/.local/share/nvim/plugged
" - avoid using standard vim directory names like 'plugin'
call plug#begin('~/.nvim/plugged')
" Plug Editor {{{
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pechorin/any-jump.vim'
Plug 'Yggdroot/indentLine'
Plug 'raimondi/delimitmate'
Plug 'AndrewRadev/splitjoin.vim'
" Plug 'sirver/ultisnips'
" }}}

" Plug tpope {{{
" Plug 'jesseleite/vim-agriculture'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch' "async compile
" Plug 'junegunn/rainbow_parentheses.vim'
" }}}


" Plug Autocomplete {{{
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'dense-analysis/ale'
" is .flowconfig inside project folder
" }}}

" Plug Themes {{{
" Plug 'Chiel92/vim-autoformat'
" Plug 'tomasr/molokai'
" Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
" Plug 'haishanh/night-owl.vim'
" Plug 'dracula/vim'
" }}}

" Plug Go {{{
Plug 'fatih/vim-go', { 'tag': '*' }
" }}}

" ROR {{{
Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-rails'
" Plug 'slim-template/vim-slim'
" }}}

" Elixir {{{
" https://github.com/kbrw/elixir.nvim
" Plug 'elixir-lang/vim-elixir'
" Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
" Plug 'thinca/vim-ref'
" }}}

" Javascript {{{
" https://github.com/carlitux/deoplete-ternjs
" create file ~/.tern-project  after :PlugInstall
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" }}}

" Plug LanguageClient {{{
" Plug 'autozimu/LanguageClient-neovim', {
    " \ 'branch': 'next',
    " \ 'do': 'bash install.sh',
    " \ }
" Plug 'reasonml-editor/vim-reason-plus'
" }}}

" My custom plugins {{{
Plug '~/.vim/plugged/vim-secret'
" Plug '~/.vim/plugged/todos-org'
" }}}
call plug#end()

" Themes setting {{{
if (has("termguicolors"))
  " let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  " let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors " Link: https://github.com/rakr/vim-one/issues/60#issuecomment-333296652
endif
syntax enable
" colorscheme one "Link: https://github.com/rakr/vim-one#true-color-support
let g:one_allow_italics = 1
" colorscheme night-owl
" set background=light
set background=dark
" colorscheme molokai
let g:gruvbox_italic=1
colorscheme gruvbox
" colorscheme dracula
" }}}

" Vim-ariline setting {{{
let g:airline_powerline_fonts=1
" let g:airline_theme='night_owl'
" let g:airline_theme='simple'
" let g:airline_theme='one'
let g:airline_theme='gruvbox'
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
" }}}

" Global setting {{{
let mapleader = ","
noremap <C-n> :cnext<CR>
noremap <C-p> :cprevious<CR>
noremap <C-c> :cclose<CR>
nnoremap <leader>c :cclose<CR>
" }}}

" VIM-GO setting {{{
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  :GoAddTags<CR>
autocmd FileType go nmap <leader>rt  :GoRemoveTags<CR>
autocmd FileType go nmap <leader>gi  :GoImports<CR>
autocmd FileType go nmap <leader>ga  :GoAlternate<CR>
autocmd FileType go nmap <leader>gd  :GoDecls<CR>
autocmd FileType go nmap <leader>ggd  :GoDeclsDir<CR>
" Sometime use leader is delay, so use `g` instead
autocmd FileType go nmap gt  <Plug>(go-def)
autocmd FileType go nmap gb  <Plug>(go-def-pop)
autocmd FileType go nmap gs  <Plug>(go-def-stack)
autocmd FileType go nmap gc  <Plug>(go-def-stack-clear)
" let g:go_fmt_command = "goimports"
let g:go_fmt_command = "gofmt"
let g:go_rename_command = "gopls"
" let g:go_def_mode = "godef" "https://github.com/fatih/vim-go/issues/1877#issuecomment-405507049
let g:go_addtags_transform = "snakecase"
let g:go_def_mapping_enabled = 0
let g:go_gopls_enabled=0
" https://hackernoon.com/my-neovim-setup-for-go-7f7b6e805876
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_decls_includes = "func,type"
let g:go_list_type = "quickfix"
" }}}

" UltiSnips setting {{{
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
" let g:UltiSnipsJumpBackwardTrigger="<c-m>"
" }}}

" FZF setting {{{
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>p :Buffers<CR>
nnoremap <leader>a :Rg<Space>
nnoremap <expr> <leader>A ':Rg '.expand('<cword>')
let $FZF_DEFAULT_COMMAND='fd --type f'
" https://www.erickpatrick.net/blog/adding-syntax-highlighting-to-fzf.vim-preview-window
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
" }}}

" LSP setting {{{
" let g:LanguageClient_serverCommands = {  'reason': ['ocaml-language-server', '--stdio'], 'ocaml': ['ocaml-language-server', '--stdio'] }
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
" nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
" nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<cr>
" }}}

" Remap copy/paste {{{
vnoremap <C-y> "*y
" }}}

" Remap Tab shortcut {{{
" Change to gt and gT https://superuser.com/a/411004
nnoremap <leader>tc  :tabnew<Space>
nnoremap <leader>tq  :tabclose<CR>
" }}}

" Rainbow parentheses setting {{{
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END
" }}}

" NERDTree setting {{{
nnoremap <silent> <leader>kb :NERDTreeToggle<CR>
" }}}

" Nerdcommenter {{{
let g:NERDSpaceDelims = 1
" }}}

" COC setting {{{
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
" goto variable, method, struct user
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
" }}}

" ALE setting {{{
"https://github.com/dense-analysis/ale#5iii-how-can-i-use-ale-and-cocnvim-together
let g:ale_disable_lsp = 1 
" https://hackernoon.com/my-neovim-setup-for-go-7f7b6e805876
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠' " Enable integration with airline.
let g:airline#extensions#ale#enabled = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
" nmap <silent> <C-k> <Plug>(ale_previous_wrap_error)
" nmap <silent> <C-j> <Plug>(ale_next_wrap_error)
" nmap <silent> <C-M-k> <Plug>(ale_previous_wrap_warning)
" nmap <silent> <C-M-j> <Plug>(ale_next_wrap_warning)
" use quickfix instead of loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
" let g:ale_linters_explicit = 1
" }}}

" Any-jump setting {{{
" Unset AnyJumpBack and AnyJumpLastResutls since clash with ,a
let g:any_jump_disable_default_keybindings=1
let g:any_jump_search_prefered_engine = 'rg'
nnoremap <leader>jj :AnyJump<CR>
xnoremap <leader>jj :AnyJumpVisual<CR>
nnoremap <leader>jb :AnyJumpBack<CR>
nnoremap <leader>jl :AnyJumpLastResults<CR>
" }}}

" VIMRC map {{{
nnoremap <leader>ve :e $MYVIMRC<cr>
nnoremap <leader>vv :vs $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>
" }}}

" Tab {{{
set list lcs=tab:\|\ 
" }}}

let g:ruby_host_prog = '/Users/adityapratama/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/neovim-0.8.1/exe/neovim-ruby-host'

" JSON formatter {{{
" https://coderwall.com/p/faceag/format-json-in-vim
autocmd FileType json nmap <leader>jf :%!python3 -m json.tool<CR>
" https://til.hashrocket.com/posts/ha0ci0pvkj-format-json-in-vim-with-jq
" :%! jq .
" :%! jq '[.products[].id]
autocmd FileType json nmap <leader>jq :%!jq 
" }}}

function MyRegisterJSPath()
  set path+=$PWD
  set suffixesadd+=.js
endfunction
