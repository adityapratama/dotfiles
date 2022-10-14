vim.o.backspace = 'indent,eol,start'
vim.o.relativenumber = true
vim.o.number = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.autowrite = true
-- https://stackoverflow.com/questions/15962421/how-can-i-disable-scratch-preview-window
vim.cmd [[set completeopt-=preview]]
-- Set completeopt to have a better completion experience
vim.cmd [[set completeopt=menu,menuone,noinsert,noselect]]
-- Avoid showing message extra message when using completion
vim.cmd [[set shortmess+=c]]
vim.o.cursorline = true
vim.o.splitright = true
vim.o.hidden = true
vim.o.mouse = 'a'
vim.o.laststatus = 3
vim.o.cmdheight = 1
vim.cmd [[ set colorcolumn=100 ]]
vim.cmd [[ set list lcs=tab:\│\ ]]
-- vim.cmd [[ set cmdheight=0 ]]
