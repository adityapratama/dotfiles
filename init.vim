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
set cursorline
" specify a directory for plugins
" - for neovim: ~/.local/share/nvim/plugged
" - avoid using standard vim directory names like 'plugin'
call plug#begin('~/.nvim/plugged')
" ****** MANDATORY Plugin *****
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
" Plug 'jesseleite/vim-agriculture'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch' "async compile
Plug 'Yggdroot/indentLine'
Plug 'raimondi/delimitmate'
Plug 'fatih/vim-go', { 'tag': '*' } " Golang
Plug 'AndrewRadev/splitjoin.vim'
Plug 'sirver/ultisnips'
" ****** END MANDATORY Plugin *****

" New Autocomplete
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Plug 'dense-analysis/ale' //disabled, since always run flow server if there
" is .flowconfig inside project folder
" End New Autocomplete

" make sure you use single quotes
" shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'
" any valid git url is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" multiple plug commands can be written in a single line using | separators
" plug 'sirver/ultisnips' | plug 'honza/vim-snippets'

" on-demand loading

" using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
 
" Autocomplete
" How to move?
"   Ctrl+N : down, Ctrl+P : up
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
" Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
" Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.nvim/plugged/gocode/nvim/symlink.sh' }
" Plug 'visualfc/gocode', { 'rtp': 'nvim', 'do': '~/.nvim/plugged/gocode/nvim/symlink.sh' }
" Plug 'zchee/deoplete-go', { 'do': 'make'}
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'zchee/deoplete-clang'
" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', {'for': ['typescript', 'tsx'], 'do': './install.sh' } " https://github.com/mhartington/nvim-typescript/issues/137

" plugin outside ~/.vim/plugged with post-update hook
" Plug 'neomake/neomake'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
" Plug 'terryma/vim-multiple-cursors'

" Themes
" Plug 'Chiel92/vim-autoformat'
" Plug 'tomasr/molokai'
" Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
" Plug 'haishanh/night-owl.vim'
" End Themes

" ROR
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'slim-template/vim-slim'
" End ROR

" Elixir
" https://github.com/kbrw/elixir.nvim
" Plug 'elixir-lang/vim-elixir'
" Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
" Plug 'thinca/vim-ref'

" Javascript
" https://github.com/carlitux/deoplete-ternjs
" create file ~/.tern-project  after :PlugInstall
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

Plug 'junegunn/rainbow_parentheses.vim'

" Plug 'reasonml-editor/vim-reason-plus'
" Plug 'autozimu/LanguageClient-neovim', {
    " \ 'branch': 'next',
    " \ 'do': 'bash install.sh',
    " \ }

" Plug 'chr4/nginx.vim'
" Plug 'AoLab/vim-avro'
" Plug 'udalov/kotlin-vim'

Plug '~/.vim/plugged/vim-secret'
call plug#end()

" Themes
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
" End Themes

" Neomake
" To open and close manually error window
" :lopen, :lclose, :copen, cclose
" autocmd! BufWritePost * Neomake
" Open error window
" let g:neomake_open_list = 2
" Enf Neomake

" Vim-ariline
let g:airline_powerline_fonts=1
" let g:airline_theme='night_owl'
" let g:airline_theme='simple'
" let g:airline_theme='one'
let g:airline_theme='gruvbox'
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
" End Vim-airline

" Global
let mapleader = ","
noremap <C-n> :cnext<CR>
noremap <C-p> :cprevious<CR>
noremap <C-c> :cclose<CR>
" End Global

" VIM-GO
nnoremap <leader>c :cclose<CR>
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
" END VIM-GO

" UltiSnips
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
" let g:UltiSnipsJumpBackwardTrigger="<c-m>"
" End UltiSnips

" CtrlP
" let g:ctrlp_working_path_mode = 'a'
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" nnoremap <Leader>p :CtrlPBuffer<CR>
" End CtrlP

" ACK
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <leader>a :Rg<Space>
nnoremap <expr> <leader>A ':Rg '.expand('<cword>')
" End ACK

" FZF
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>p :Buffers<CR>
" End of FZF

" Deoplete
" neocomplete like
" set completeopt+=noinsert
" deoplete.nvim recommend
" set completeopt+=noselect
" Path to python interpreter for neovim
" let g:python3_host_prog  = '/Library/Frameworks/Python.framework/Versions/3.6/bin/python3'
" Skip the check of neovim module
" let g:python3_host_skip_check = 1
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#go#gocode_binary = '~/project/go/bin/gocode'
" let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" let g:deoplete#sources#clang#clang_header = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang'
" let g:'ocaml-language-server', '--stdio'ibclang_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
" End Deoplete

" Goyo
" map <Leader>g :Goyo<CR>
" map <Leader>l :Limelight!!<CR>
" let g:goyo_width = 90
" let g:goyo_height = 95
" End Goyo

" LSP
" let g:LanguageClient_serverCommands = {  'reason': ['ocaml-language-server', '--stdio'], 'ocaml': ['ocaml-language-server', '--stdio'] }
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
" nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
" nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<cr>
" End LSP

" Remap copy/paste
" vmap <C-y> "*y
noremap <C-y> "*y

" Map Tab shortcut
" nnoremap <leader>tn  :tabnext<CR>
" nnoremap <leader>tp  :tabprev<CR>
" Change to gt and gT https://superuser.com/a/411004
nnoremap <leader>tc  :tabnew<Space>
nnoremap <leader>tq  :tabclose<CR>

imap jj <Esc>
imap jk <Esc>

" Rainbow parentheses
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" noremap <Leader>e64 :s/\(\w\+.*\): \(\w\+.*\)/\=substitute(substitute(submatch(1).": ".submatch(2), submatch(2), system('base64', submatch(2)), ""), "\n", "", "")<CR><CR>
" noremap <Leader>d64 :s/\(\w\+.*\): \(\w\+.*\)/\=substitute(substitute(submatch(1).": ".submatch(2), submatch(2), system('base64 --decode', submatch(2)), ""), "\n", "", "")<CR>:nohlsearch<CR>

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" NERDTree
map <silent> <leader>kb :NERDTreeToggle<CR>
" NERDTree end

" Nerdcommenter
let g:NERDSpaceDelims = 1
" End of Nerdcommenter

" COC
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
" END COC

" ALE
" https://hackernoon.com/my-neovim-setup-for-go-7f7b6e805876
" Error and warning signs.
" let g:ale_sign_error = '⤫'
" let g:ale_sign_warning = '⚠' " Enable integration with airline.
" let g:airline#extensions#ale#enabled = 1
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
" ALE END

" ANY-JUMP
" Unset AnyJumpBack and AnyJumpLastResutls since clash with ,a
let g:any_jump_disable_default_keybindings=1
let g:any_jump_search_prefered_engine = 'rg'
nnoremap <leader>jj :AnyJump<CR>
xnoremap <leader>jj :AnyJumpVisual<CR>
nnoremap <leader>jb :AnyJumpBack<CR>
nnoremap <leader>jl :AnyJumpLastResults<CR>
" ANY-JUMP END

nnoremap <leader>ve :e $MYVIMRC<cr>
nnoremap <leader>vv :vs $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

set list lcs=tab:\|\ 

" function Rip()
  " let word = expand('<cword>')
  " execute '!rg --column --line-number --no-heading --color=never --smart-case '.word 
  " execute 'Rg '.word
" endfunction

" function FF()
  " let last_yank = @"
  " normal yi'
  " if @" == last_yank
    " normal yi"
  " endif

  " let next_yank = @"
  " let @" = last_yank
  " let next_file = substitute(next_yank, '\.\.\/', '', 'g')
  " call fzf#vim#files('.', fzf#vim#with_preview({'options': ['--query', next_file]}))
" endfunction

" autocmd Filetype js nnoremap <leader>F :call FF()<cr>
