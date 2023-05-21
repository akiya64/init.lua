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

-- highlight
vim.cmd([[
colorscheme soifon
]])

vim.cmd [[highlight IndentBlanklineIndent guifg=#c0c0c0 gui=nocombine ]]
vim.cmd [[highlight IndentBlanklineContextchar guifg=#909090 gui=nocombine ]]
require("indent_blankline").setup {
	show_current_context = true,
	char_highlight_list = { "IndentBlanklineIndent" },
}

require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }

}
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
