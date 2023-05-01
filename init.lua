require('colemak')
require('options')
require('plugins')
require('lsp')
require('status_line')

vim.cmd [[
colorscheme soifon
]]

vim.keymap.set('n', 'W', '<C-Left>')
