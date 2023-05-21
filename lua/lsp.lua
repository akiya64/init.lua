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

--[[
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' },
	},
})

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


--[[
  ref:https://daniele.tech/2021/07/neovim-lsp-with-intelephense-for-php-and-wordpress-and-others/
  require install intelephense
  `npm install -g intelephense`
  and require install stubs
  `composer global require php-stubs/wordpress-globals php-stubs/wordpress-stubs php-stubs/acf-pro-stubs wpsyntex/polylang-stubs php-stubs/wp-cli-stubs`
--]]

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
