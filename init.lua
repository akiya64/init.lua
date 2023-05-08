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
vim.api.nvim_create_user_command('ShowRootHighlightUnderCursor', function()
	local function findRoot(id, tree)
		local transId = vim.fn.synIDtrans(id)
		local name = vim.fn.synIDattr(id, 'name')
		table.insert(tree, name)

		if id == transId then
			print(table.concat(tree, ' -> '))
		else
			findRoot(transId, tree)
		end
	end

	local id = vim.fn.synID(vim.fn.line("."), vim.fn.col("."), 0)
	findRoot(id, {})
end, {})
