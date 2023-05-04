require('options')

require('colemak')
require('keymap')

require('plugins')

require('lsp')
require('linter')
require('filer')

require('status_line')

require('session_wrapper')

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
