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
vim.cmd [[highlight IndentBlanklineIndent guifg=#c0c0c0 gui=nocombine ]]
vim.cmd [[highlight IndentBlanklineContextchar guifg=#909090 gui=nocombine ]]
require("indent_blankline").setup {
	show_current_context = true,
	char_highlight_list = { "IndentBlanklineIndent" },
}
