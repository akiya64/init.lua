return {
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest",
    config = function()
      require("mcphub").setup()
    end
  },

  "zbirenbaum/copilot.lua",

  -- https://minerva.mamansoft.net/2025-03-21-codecompanion-neovim-ai-coding
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = function(_, opts)
      local base_opts = {
        languages = "Japanese"
      }
      local env_opts = require("envs.code-companion").opts

      return vim.tbl_deep_extend("force", opts, base_opts, env_opts)
    end,
  }
}
