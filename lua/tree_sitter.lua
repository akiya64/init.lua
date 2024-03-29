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
    'typescript',
    'tsx',
    'toml',
    'json',
    'yaml',
    'css',
    'html',
  },
  autotag = {
    enable = true,
  },
}
