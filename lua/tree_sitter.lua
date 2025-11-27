require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    'php',
    'php_only',
    'typescript',
    'tsx',
    'json',
    'yaml',
    'html',
  },
  autotag = {
    enable = true,
  },
}
