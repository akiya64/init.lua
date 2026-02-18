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
        languages = "Japanese",
        strategies = {
            chat = {
              adapter = function()
                return require('codecompanion.adapters').extend('ollama', {
                  schema = {
                    model = {
                      default = 'granite3.3:8b'
                    },
                  },
                })
              end,
               tools = {
                    ["mcp"] = { -- Name this tool whatever you like
                        -- Callback provides the necessary functions to CodeCompanion
                        callback = function()
                            return require("mcphub.extensions.codecompanion")
                        end,
                        opts = {
                          -- If true, CodeCompanion will ask for approval before executing the MCP tool call
                          requires_approval = false,
                          -- Optional: Pass parameters like temperature to the underlying LLM if the chat strategy supports it
                          temperature = 0.7
                        }
                    }
                    -- Add other CodeCompanion tools here
                }
            }
            -- Other CodeCompanion strategies
        },
        opts = {
          log_level = 'DEBUG',
        },
      }

      local env_opts = require("envs.code-companion").opts

      return vim.tbl_deep_extend("force", opts, base_opts, env_opts)
    end,
  }
}
