return{
  {
  -- common
  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  --'nvim-telescope/telescope.nvim',
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

  { 'nvim-treesitter/nvim-treesitter', branch = "main" },

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
  
  {
  "mhartington/formatter.nvim",
  config = function()
    require("formatter").setup({
      filetype = {
        javascript = {require("formatter.filetypes.javascript").biome},
        javascriptreact = {require("formatter.filetypes.javascriptreact").biome},
        typescript = {require("formatter.filetypes.typescript").biome},
        typescriptreact = {require("formatter.filetypes.typescriptreact").biome},
        astro = {require("formatter.filetypes.typescriptreact").biome},
      },
    })
  end,
  },

  'lilydjwg/colorizer',
}}
