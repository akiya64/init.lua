-- LSP Sever management
require('mason').setup()

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

-- autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
--
-- 3. completion (hrsh7th/nvim-cmp)
local cmp = require('cmp')
local lspkind = require('lspkind')
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

-- astro --
local lspconfig = require('lspconfig')

lspconfig.astro.setup({
  filetypes = { 'astro', 'typescript' },
  init_options = {
    typescript = {
      tsdk = vim.fs.normalize('~/AppData/Local/nvim-data/mason/packages/typescript-language-server/node_modules/typescript/lib/')
    }
  }
})
local nvim_lsp = require 'lspconfig'
nvim_lsp.intelephense.setup({
  filetypes = {"php"},
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	settings = {
		intelephense = {
			stubs = {
                "bcmath",
                "bz2",
                "Core",
                "curl",
                "date",
                "dom",
                "fileinfo",
                "filter",
                "gd",
                "gettext",
                "hash",
                "iconv",
                "imap",
                "intl",
                "json",
                "libxml",
                "mbstring",
                "mcrypt",
                "mysql",
                "mysqli",
                "password",
                "pcntl",
                "pcre",
                "PDO",
                "pdo_mysql",
                "Phar",
                "readline",
                "regex",
                "session",
                "SimpleXML",
                "sockets",
                "sodium",
                "standard",
                "superglobals",
                "tokenizer",
                "xml",
                "xdebug",
                "xmlreader",
                "xmlwriter",
                "yaml",
                "zip",
                "zlib",
				"wordpress",
				"acf-pro",
				"wordpress-globals",
				"wp-cli",
				"polylang"
			},
		};
	}
});
