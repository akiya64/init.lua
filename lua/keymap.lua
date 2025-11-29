vim.keymap.set('n', '<C-s>', ':w<CR>')

vim.keymap.set('n', '<C-p>', ':tabprevious<CR>')
vim.keymap.set('n', '<C-n>', ':tabnext<CR>')

-- register 'x' does not yank
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('n', 'X', '"_X')

-- terminal
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { silent = true })

-- leader shortcut
vim.keymap.set('n', '<leader>so', '<cmd>source %<CR>')
vim.keymap.set('n', '<leader>ei', '<cmd>e ~/AppData/Local/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>cp', '<cmd>cd %:h<CR>pwd<CR>')
