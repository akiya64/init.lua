require('options')
require('plugins')

require('colemak')
require('keymap')

require('linter')
require('lsp')
require('filer')

require('status_line')

require('session_wrapper')
require('tree_sitter')

require('highlighting')

-- functions
vim.api.nvim_create_autocmd('QuickFixCmdPost',{
	pattern = '*grep*',
	command = 'cwindow'
})

vim.api.nvim_create_autocmd('BufEnter',{
	pattern = '*.php',
	command = 'set syn=wordpress'
})

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
