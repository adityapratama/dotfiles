" zr - open all folding
" zm - close all folding
" za - toggle single foling

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
" Set completeopt to have a better completion experience
set completeopt=menu,menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c
set cursorline
set colorcolumn=100
set splitright
set hidden
set mouse=a
set laststatus=3
" }}}

" specify a directory for plugins
" - for neovim: ~/.local/share/nvim/plugged
" - avoid using standard vim directory names like 'plugin'
call plug#begin('~/.nvim/plugged')
Plug 'neovim/nvim-lspconfig'
" Plug Autocomplete {{{
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
" }}}

" Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-fzf-writer.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'kyazdani42/nvim-web-devicons'
" Plug Editor {{{
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'christoomey/vim-tmux-navigator'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() }  }
Plug 'junegunn/fzf.vim'
" Plug 'pechorin/any-jump.vim'
Plug 'Yggdroot/indentLine'
Plug 'raimondi/delimitmate'
Plug 'AndrewRadev/splitjoin.vim'
" }}}

" Plug tpope {{{
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch' "async compile
" }}}

" Plug Themes {{{
Plug 'gruvbox-community/gruvbox'
" }}}

" Plug Go {{{
Plug 'fatih/vim-go', { 'tag': '*' }
" }}}

" My custom plugins {{{
Plug '~/.vim/plugged/vim-secret'
Plug '~/.nvim/plugged/vim-org'
Plug '~/.nvim/plugged/my-markdown'
" Plug '~/.vim/plugged/todos-org'
" }}}

Plug 'nvim-treesitter/nvim-treesitter', {'branch': '0.5-compat','do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-refactor'

call plug#end()

" termgui & syntax setting {{{
if (has("termguicolors"))
  " let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  " let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors " Link: https://github.com/rakr/vim-one/issues/60#issuecomment-333296652
endif
syntax enable
" }}}

" Theme setting {{{
set background=dark
" let g:gruvbox_bold=0
let g:gruvbox_italic=1
let g:gruvbox_contrast_light="hard"
colorscheme gruvbox
" }}}

" Global setting {{{
let mapleader = ","
noremap <C-n> :cnext<CR>
noremap <C-p> :cprevious<CR>
" noremap <C-c> :cclose<CR>
nnoremap <leader>q :cclose<CR>
" }}}

" VIM-GO setting {{{
augroup golang
  autocmd!
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
augroup END

let g:go_fmt_autosave=0 " disable since i use lua vim.lsp.formating(1000)
let g:go_imports_autosave=0 " disable since i use lua goimports(1000)
let g:go_addtags_transform = "snakecase"
let g:go_def_mapping_enabled = 0
let g:go_gopls_enabled=0
let g:go_diagnostics_enabled=0
" }}}

" UltiSnips setting {{{
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
" let g:UltiSnipsJumpBackwardTrigger="<c-m>"
" }}}

" FZF setting {{{
nnoremap <Leader>tt :Files<CR>
nnoremap <Leader>p :Buffers<CR>
nnoremap <leader>a :Rg<Space>
nnoremap <expr> <leader>A ':Rg '.expand('<cword>')
let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.75 } }
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
" https://www.erickpatrick.net/blog/adding-syntax-highlighting-to-fzf.vim-preview-window
let $FZF_DEFAULT_OPTS="--ansi --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" }}}

" Remap vim command such as copy/paste, resize window etc {{{
vnoremap <C-y> "*y
command! Paste :exec "0put +"
command! JsFmt :%! js-beautify - --type js<CR>
command! HtmlFmt :%! js-beautify - --type html<CR>
command! Zo :exec "vertical resize ". float2nr(0.9 * str2nr(&columns))
command! Zi :exec "vertical resize ". float2nr(0.5 * str2nr(&columns))
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
" nnoremap <leader>= <C-w>=
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

" VIMRC map {{{
nnoremap <leader>ve :e $MYVIMRC<cr>
nnoremap <leader>vv :vs $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>
" }}}

" Tab {{{
" for golang since gofmt use tab instead of space
set list lcs=tab:\|\ 
" }}}

let g:ruby_host_prog = '/Users/adityapratama/.rbenv/versions/2.7.1/lib/ruby/gems/2.7.0/gems/neovim-0.8.1/exe/neovim-ruby-host'

" JSON formatter {{{
augroup json_formater
  autocmd!
  " https://coderwall.com/p/faceag/format-json-in-vim
  autocmd FileType json nmap <leader>jf :%!python3 -m json.tool<CR>
  " https://til.hashrocket.com/posts/ha0ci0pvkj-format-json-in-vim-with-jq
  " :%! jq .
  " :%! jq '[.products[].id]
  autocmd FileType json nmap <leader>jq :%!jq
augroup END
" }}}

" Fold {{{
augroup fold_method
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Tag/Ctag setting {{{
augroup tag_path
  autocmd!
  autocmd FileType javascript,js set path+=$PWD suffixesadd+=.js
augroup END
" }}}

" Fugitive {{{
func! s:GGcmd(type)
  silent !clear
  let l:branch = system("git rev-parse --abbrev-ref HEAD")
  execute "! git ".a:type." origin ".l:branch
endfunc

func! s:Gcmd(type)
  silent !clear
  execute "! git ".a:type
endfunc

command! GGpush call <SID>GGcmd("push")
command! GGpull call <SID>GGcmd("pull")
command! Gpush call <SID>Gcmd("push")
command! Gpull call <SID>Gcmd("pull")
" }}}

" Neovim Terminal {{{
" tnoremap <Esc> <C-\><C-n>
" }}}

lua require('adityapra')

" Telescope {{{
lua <<EOF
local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      }
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },
  --    fzf = {
  --      fuzzy = true,                    -- false will only do exact matching
  --      override_generic_sorter = false, -- override the generic sorter
  --      override_file_sorter = true,     -- override the file sorter
  --      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
  --  }
  }
}
require('telescope').load_extension('fzy_native')

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
-- require('telescope').load_extension('fzf')
EOF

nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>ta <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>ta <cmd>lua require("telescope.builtin").grep_string { path_display = { "shorten" }, search = vim.fn.input "Grep String > "}<cr>
nnoremap <leader>tb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>th <cmd>lua require('telescope.builtin').help_tags()<cr>
" }}}

lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('v', '<leader>ca', ':<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      " https://expectationmax.github.io/2020/NeoVims-Language-Server-Client/
      highlight LspReference guifg=NONE guibg=#665c54 guisp=NONE gui=NONE cterm=NONE ctermfg=NONE ctermbg=59
      highlight! link LspReferenceText LspReference
      highlight! link LspReferenceRead LspReference
      highlight! link LspReferenceWrite LspReference
    ]], false)
  end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

local util = require 'lspconfig/util'
local servers = { "gopls", "efm", "clangd", "rust_analyzer", "tsserver"}
for _, lsp in ipairs(servers) do
  if lsp == "efm" then
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      -- init_options = {documentFormatting = true},
      filetypes = {"javascript"},
      root_dir = function(fname)
        -- Omit multi .eslintrc insinde root_dir
        if string.find(fname, "browser") then
          pattern = util.root_pattern(".eslintrc")(fname)
          new_pattern = pattern:gsub("/src/browser", "")

          return new_pattern
        end

        return util.root_pattern(".eslintrc")(fname)
      end,
      settings = {
        rootMarkers = {".eslintrc"},
        languages = {
          javascript = {eslint}
        }
      },
      flags = {
        debounce_text_changes = 500
      }
    }
  elseif lsp == "rust_analyzer" then
    nvim_lsp[lsp].setup {
      on_attach=on_attach,
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          assist = {
            importMergeBehavior = "last",
            importPrefix = "by_self",
          },
          cargo = {
            loadOutDirsFromCheck = true
          },
          procMacro = {
            enable = true
          },
        }
      },
      handlers =  {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
          vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = true,
            update_in_insert = true,
            severity_sort = true,
          }
        ),
      }
    }
  elseif lsp == "tsserver" then
    nvim_lsp[lsp].setup {
      on_attach=on_attach,
      capabilities = capabilites,
      filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
    }
  else
    nvim_lsp[lsp].setup { on_attach = on_attach }
  end
end
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
    -- disable = {"ruby", "go"},  -- list of language that will be disabled
    -- disable = {"javacript"},  -- list of language that will be disabled
  },
  refactor = {
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
  },
}
EOF

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
     mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-x>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
    }),
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' },
      -- { name = 'buffer' },
    }
  })
EOF

lua <<EOF
function goimports(timeout_ms)
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, "t", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  -- See the implementation of the textDocument/codeAction callback
  -- (lua/vim/lsp/handler.lua) for how to do this properly.
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  if not result then print("`gopls` is not running...Please check it!") end
  if not result or next(result) == nil then return end
  local actions = result[1].result
  if not actions then return end
  local action = actions[1]
  -- Say to LSP command, don't fill my struct automatically
  local argument = action.command and action.command.arguments and action.command.arguments[1]
  if argument and argument.Fix == "fill_struct" then return end

  -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
  -- is a CodeAction, it can have either an edit, a command or both. Edits
  -- should be executed first.
  if action.edit or type(action.command) == "table" then
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit)
    end
    if type(action.command) == "table" then
      vim.lsp.buf.execute_command(action.command)
    end
  else
    vim.lsp.buf.execute_command(action)
  end
end
EOF

augroup lsp_buf_format
  autocmd!
  autocmd BufWritePre *.go lua goimports(300)
  autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
  autocmd BufWritePre *.rs lua vim.lsp.buf.formatting(nil, 5000)
augroup END

nnoremap <leader>nt :e ~/project/org/hijup.org<CR>

nnoremap <leader>? :lua require('clue').new()<CR>


" custom statusline{{{
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'[ '.l:branchname.']':''
endfunction

function! Mode()
  let mode = mode(1)
  let mode_map = {
    \ '__' : '------',
    \ 'n' : 'NORMAL',
    \ 'no' : 'OP PENDING',
    \ 'nov' : 'OP PENDING CHAR',
    \ 'noV' : 'OP PENDING LINE',
    \ 'no' : 'OP PENDING BLOCK',
    \ 'niI' : 'INSERT (NORMAL)',
    \ 'niR' : 'REPLACE (NORMAL)',
    \ 'niV' : 'V REPLACE (NORMAL)',
    \ 'v' : 'VISUAL',
    \ 'V' : 'V-LINE',
    \ '' : 'V-BLOCK',
    \ 's' : 'SELECT',
    \ 'S' : 'S-LINE',
    \ '' : 'S-BLOCK',
    \ 'i' : 'INSERT',
    \ 'ic' : 'INSERT COMPL GENERIC',
    \ 'ix' : 'INSERT COMPL',
    \ 'R' : 'REPLACE',
    \ 'Rc' : 'REPLACE COMP GENERIC',
    \ 'Rv' : 'V REPLACE',
    \ 'Rx' : 'REPLACE COMP',
    \ 'c'  : 'COMMAND',
    \ 'cv'  : 'VIM EX',
    \ 'ce'  : 'EX',
    \ 'r'  : 'PROMPT',
    \ 'rm'  : 'MORE PROMPT',
    \ 'r?'  : 'CONFIRM',
    \ '!'  : 'SHELL',
    \ 't'  : 'TERMINAL',
    \ 'multi' : 'MULTI',
    \ }

  return mode_map[mode]
endfunction

set noshowmode
set statusline=%#StatusLineMode#\ %{Mode()}\ %#StatusLine#\ %f\ %{StatuslineGit()}\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" soft
" highlight StatusLine guibg=#7c6f64 ctermbg=243 guifg=#282828 ctermfg=235
" highlight ModeMsg guibg=#282828 ctermbg=235 guifg=#ebdbb2 ctermfg=223
" highlight MsgArea guibg=#282828 ctermbg=235 guifg=#928374 ctermfg=245

" blue
highlight StatusLine guibg=#458588 ctermbg=243 guifg=#282828 ctermfg=235
highlight MsgArea guibg=#282828 ctermbg=235 guifg=#458588 ctermfg=245
highlight ModeMsg guibg=#282828 ctermbg=235 guifg=#458588 ctermfg=245

highlight StatusLineMode guibg=#458588 ctermbg=235 guifg=#282828 ctermfg=245
au InsertLeave * highlight StatusLineMode guibg=#458588 ctermbg=235 guifg=#282828 ctermfg=245
au InsertEnter * highlight StatusLineMode guibg=#689d6a ctermbg=235 guifg=#282828 ctermfg=245
" }}}

" Workaround of neovim diagnostic Error gruvbox color {{{
highlight DiagnosticError guifg=#cc241d
" }}}

" Flash highlight after yank {{{
au TextYankPost * silent! lua vim.highlight.on_yank()
" }}}

let g:indentLine_color_gui = '#3c3836'
