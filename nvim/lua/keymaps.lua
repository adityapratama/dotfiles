-- Telescope
vim.keymap.set({ 'n' }, '<leader>f', require('telescope.builtin').find_files)
-- FZF
vim.keymap.set({ 'n' }, '<leader>p', ':Buffers<CR>')
-- nvim-tree
vim.keymap.set({ 'n' }, '<leader>kb', ':NvimTreeToggle<CR>')
vim.keymap.set({ 'n' }, '<leader>a', ':Rg<Space>')
vim.keymap.set({ 'n' }, '<leader>A', [[':Rg '.expand('<cword>')]], { expr = true })
-- Copy to clipboard
vim.keymap.set({ 'v' }, '<C-y>', '"*y')
