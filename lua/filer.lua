local action = require('vfiler/action')

require 'vfiler/config'.setup {
	options = {
		columns = 'indent,devicons,name',
		auto_cd = false,
		width = 30
	},
	mappings = {
		['i'] = action.open_tree,
		[' '] = action.open_tree,
		['o'] = action.open,
	}
}

vim.keymap.set('n', '<leader>ff', '<cmd>VFiler -layout=floating<CR>')
vim.keymap.set('n', '<leader>fe', '<cmd>VFiler<CR>')
vim.keymap.set('n', '<leader>fi', '<cmd>VFiler -layout=left -keep<CR>')
