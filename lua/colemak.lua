-- Colemak対応 hはQWERTYと同じ

-- e <-> k
vim.keymap.set('', 'E', 'K')
vim.keymap.set('', 'e', 'gk')
vim.keymap.set('', 'k', 'N')
vim.keymap.set('', 'K', 'n')
vim.keymap.set('n', '<C-w>n', '<C-w>j')
vim.keymap.set('n', '<C-w>e', '<C-w>k')

-- i <-> l
vim.keymap.set('', 'i', 'l')
vim.keymap.set('', 'I', 'L')
vim.keymap.set('', 'l', 'i')
vim.keymap.set('', 'L', 'I')
vim.keymap.set('n', '<C-w>I', '<C-w>L')
vim.keymap.set('n', '<C-w>i', '<C-w>l')

-- n <-> j
vim.keymap.set('', 'N', 'J')
vim.keymap.set('', 'n', 'gj')
vim.keymap.set('', 'j', 'e')
vim.keymap.set('', 'J', 'E')
vim.keymap.set('n', '<C-w>N', '<C-w>J')
vim.keymap.set('n', '<C-w>E', '<C-w>K')
