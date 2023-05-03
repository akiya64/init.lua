-- 1. LSP Sever management
require('mason').setup()
require('mason-lspconfig').setup_handlers({
	function(server)
		local opt = {
			-- -- Function executed when the LSP server startup
			-- on_attach = function(client, bufnr)
			--   local opts = { noremap=true, silent=true }
			--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
			--   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
			-- end,
			capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		}
		require('lspconfig')[server].setup(opt)
	end,
})

-- 2. build-in LSP function
-- keyboard shortcut
-- LSP handlers
vim.lsp.handlers['textDocument/publishDiagnostics'] =
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })

-- Reference highlight
-- highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
vim.cmd([[
set updatetime=500
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
augroup lsp_document_highlight
  autocmd!
  autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
augroup END
]])

-- autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
--
-- 3. completion (hrsh7th/nvim-cmp)
local cmp = require('cmp')
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn['vsnip#anonymous'](args.body)
		end,
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
	},
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-l>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	experimental = {
		ghost_text = true,
	},
})

cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' },
	},
})

--[[
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' },
	}, {
		{
			name = 'cmdline',
			option = {
				ignore_cmds = { 'Man', '!' },
			},
		},
	}),
})
--]]
