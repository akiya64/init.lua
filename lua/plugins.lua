vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'

  use 'Shougo/defx.nvim'
  use 'Shougo/denite.nvim'

  use 'nvim-lualine/lualine.nvim'

  use 'nvim-tree/nvim-web-devicons'

  use 'akiya64/soifon'

  use 'lewis6991/gitsigns.nvim'
  use 'lukas-reineke/indent-blankline.nvim'

  use 'Editorconfig/editorconfig-vim'

  use {
		'windwp/nvim-autopairs',
		config = function() require('nvim-autopairs').setup {} end
}
  -- formatter
  use 'wesleimp/stylua.nvim'
  -- lint
  use 'mfussenegger/nvim-lint'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'uga-rosa/cmp-dictionary'

  use { 'wbthomason/packer.nvim', opt = true}
end)
