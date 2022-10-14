vim.cmd([[
augroup json_formater
  autocmd!
  " https://coderwall.com/p/faceag/format-json-in-vim
  autocmd FileType json nmap <leader>jf :%!python3 -m json.tool<CR>
  " https://til.hashrocket.com/posts/ha0ci0pvkj-format-json-in-vim-with-jq
  " :%! jq .
  " :%! jq '[.products[].id]
  autocmd FileType json nmap <leader>jq :%!jq
augroup END
]])

vim.cmd([[
augroup fold_method
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
]])

vim.cmd [[
augroup lsp_buf_format
  autocmd!
  autocmd BufWritePre *.go lua goimports(300)
  autocmd BufWritePre *.go lua vim.lsp.buf.format { async = true }
  autocmd BufWritePre *.rs lua vim.lsp.buf.format { async = true }
augroup END
]]

vim.cmd [[
au TextYankPost * silent! lua vim.highlight.on_yank()
]]
