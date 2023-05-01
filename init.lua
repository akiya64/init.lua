require('colemak')
-- keymap / leader
--
require('options')

require('plugins')
require('lsp')
require('status_line')
-- filer
-- session
-- git command

vim.cmd [[
colorscheme soifon
]]

vim.keymap.set('n', 'W', '<C-Left>')
