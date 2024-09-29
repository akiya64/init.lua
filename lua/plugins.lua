local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	-- common
	'nvim-lua/plenary.nvim',
	'nvim-lua/popup.nvim',
	'nvim-telescope/telescope.nvim',
	'Editorconfig/editorconfig-vim',

	-- appearance
	'nvim-lualine/lualine.nvim',
	'nvim-tree/nvim-web-devicons',

	{'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	},

	-- highlight
	'akiya64/soifon',

	'nvim-treesitter/nvim-treesitter',
	'nvim-treesitter/playground',

	'kloppster/Wordpress-Vim-Syntax',

	-- filer
	'obaland/vfiler.vim',
	'obaland/vfiler-column-devicons',

	-- formatter
	'wesleimp/stylua.nvim',

	-- lint
	'mfussenegger/nvim-lint',

	-- lsp
	'neovim/nvim-lspconfig',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',

	-- completion
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/vim-vsnip',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-cmdline',
	'uga-rosa/cmp-dictionary',
	'onsails/lspkind.nvim',

	{
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup()
		end,
	},

	'lilydjwg/colorizer',
})
