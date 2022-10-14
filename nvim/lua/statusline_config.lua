vim.cmd [[
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

highlight StatusLine guibg=#458588 ctermbg=243 guifg=#282828 ctermfg=235
highlight MsgArea guibg=#282828 ctermbg=235 guifg=#458588 ctermfg=245
highlight ModeMsg guibg=#282828 ctermbg=235 guifg=#458588 ctermfg=245

highlight StatusLineMode guibg=#458588 ctermbg=235 guifg=#282828 ctermfg=245
au InsertLeave * highlight StatusLineMode guibg=#458588 ctermbg=235 guifg=#282828 ctermfg=245
au InsertEnter * highlight StatusLineMode guibg=#689d6a ctermbg=235 guifg=#282828 ctermfg=245
]]

-- Catppucino
-- highlight StatusLine guibg=NONE ctermbg=243 guifg=#c0caf ctermfg=235
-- highlight MsgArea guibg=NONE ctermbg=235 guifg=#c0caf ctermfg=245
-- highlight ModeMsg guibg=#282828 ctermbg=235 guifg=#458588 ctermfg=245

-- highlight StatusLineMode guibg=#458588 ctermbg=235 guifg=#282828 ctermfg=245
-- au InsertLeave * highlight StatusLineMode guibg=#7aa2f7 ctermbg=235 guifg=#282828 ctermfg=245
-- au InsertEnter * highlight StatusLineMode guibg=#f7768e ctermbg=235 guifg=#282828 ctermfg=245
