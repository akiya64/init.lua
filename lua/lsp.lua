-- LSP Sever management
require('mason').setup()
require('mason-lspconfig').setup()

-- Reference highlight
vim.cmd([[

set updatetime=500

highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=none guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040

augroup lsp_document_highlight
  autocmd!
  autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
augroup END

]])

-- keymap --
vim.keymap.set('n', 'gd', function()
  vim.lsp.buf.hover({border = 'rounded' })
end)

vim.keymap.set('n', '<Leader>d', function()
  vim.cmd([[ split ]])
  vim.lsp.buf.definition()
end)

vim.keymap.set('n', '<Leader>fo', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('n', '<Leader>r', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', '<Leader>ldc', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', '<Leader>im', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', '<Leader>tp', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<Leader>aa', '<cmd>lua vim.lsp.buf.code_action()<CR>')

vim.keymap.set('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '<Leader>]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '<Leader>[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

-- completion (hrsh7th/nvim-cmp)
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-l>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	snippet = {
		expand = function(args)
			vim.fn['vsnip#anonymous'](args.body)
		end,
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'dictionary' },
	},
	completion = {
		keyword_length = 1,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	formatting = {
		format = lspkind.cmp_format {
			mode = 'symbol_text',
			menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				dictionary = "[Dict]",
				path = "[Path]"
			})
		},
	},
	experimental = {
		ghost_text = true,
	},
})



-- for Languages --

-- astro --
vim.lsp.config['astro'] = {
  filetypes = { 'astro' },
  init_options = {
    typescript = {
      tsdk = vim.fs.normalize('~/AppData/Local/nvim-data/mason/packages/typescript-language-server/node_modules/typescript/lib/')
    }
  }
}

-- php --
vim.lsp.config['php'] = {
  filetypes = {'php'},
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    settings = {
      intelephense = {
        stubs = {
          'bcmath',
          'bz2',
          'Core',
          'curl',
          'date',
          'dom',
          'fileinfo',
          'filter',
          'gd',
          'gettext',
          'hash',
          'iconv',
          'imap',
          'intl',
          'json',
          'libxml',
          'mbstring',
          'mcrypt',
          'mysql',
          'mysqli',
          'password',
          'pcntl',
          'pcre',
          'PDO',
          'pdo_mysql',
          'Phar',
          'readline',
          'regex',
          'session',
          'SimpleXML',
          'sockets',
          'sodium',
          'standard',
          'superglobals',
          'tokenizer',
          'xml',
          'xdebug',
          'xmlreader',
          'xmlwriter',
          'yaml',
          'zip',
          'zlib',
          'wordpress',
          'wordpress-globals',
          'wp-cli',
          'polylang',
        }
      }
    }
  }

vim.lsp.config['ts'] = {
  filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' }
}

