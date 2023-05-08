vim.keymap.set('n', '<C-s>', ':w<CR>')

vim.keymap.set('n', '<C-p>', ':tabprevious<CR>')
vim.keymap.set('n', '<C-n>', ':tabnext<CR>')

-- register 'x' does not yank
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('n', 'X', '"_X')

-- terminal
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { silent = true })

-- lsp
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

local cmp = require('cmp')
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<S-SPACE>'] = cmp.mapping.preset(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-l>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
})

-- vfiler
local action = require('vfiler/action')
require 'vfiler/config'.setup {
	mappings = {
		['i'] = action.open_tree,
		['o'] = action.open,
	}
}
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>so', '<cmd>source %<CR>')
vim.keymap.set('n', '<leader>ei', '<cmd>e ~/AppData/Local/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>cd', '<cmd>cd %:h<CR>pwd<CR>')
vim.keymap.set('n', '<leader>ff', '<cmd>VFiler -auto-cd -layout=floating<CR>')
vim.keymap.set('n', '<leader>fi', '<cmd>VFiler -auto-cd -layout=left -keep<CR>')
