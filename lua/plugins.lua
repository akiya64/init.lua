vim.cmd([[packadd packer.nvim]])

require('packer').startup(function()
	-- common
	use('nvim-lua/plenary.nvim')
	use('nvim-lua/popup.nvim')
	use('nvim-telescope/telescope.nvim')
	use('Editorconfig/editorconfig-vim')

	-- appearance
	use('lukas-reineke/indent-blankline.nvim')
	use('nvim-lualine/lualine.nvim')
	use('nvim-tree/nvim-web-devicons')
	use({
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end,
	})

	-- highlight
	use('akiya64/soifon')
	use('machakann/vim-colorscheme-snowtrek')
	use('navarasu/onedark.nvim')

	use('nvim-treesitter/nvim-treesitter')
	use('nvim-treesitter/playground')

	use('kloppster/Wordpress-Vim-Syntax')

	-- filer
	use('obaland/vfiler.vim')
	use('obaland/vfiler-column-devicons')

	-- formatter
	use('wesleimp/stylua.nvim')

	-- lint
	use('mfussenegger/nvim-lint')

	-- lsp
	use('neovim/nvim-lspconfig')
	use('williamboman/mason.nvim')
	use('williamboman/mason-lspconfig.nvim')

	-- completion
	use('hrsh7th/nvim-cmp')
	use('hrsh7th/cmp-nvim-lsp')
	use('hrsh7th/vim-vsnip')
	use('hrsh7th/cmp-path')
	use('hrsh7th/cmp-buffer')
	use('hrsh7th/cmp-cmdline')
	use('uga-rosa/cmp-dictionary')
    use('onsails/lspkind.nvim')

	use({
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup()
		end,
	})

	use({ 'wbthomason/packer.nvim', opt = true })
end)
