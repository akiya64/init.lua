require('options')
require('plugins')

require('colemak')
require('keymap')

require('lsp')
require('filer')

require('status_line')

require('session_wrapper')
require('tree_sitter')

-- git command

-- functions
--  quargs

vim.cmd([[
colorscheme soifon
]])

vim.api.nvim_create_autocmd('QuickFixCmdPost',{
	pattern = '*grep*',
	command = 'cwindow'
})
