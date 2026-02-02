return {
	"zbirenbaum/copilot.lua",

	-- https://minerva.mamansoft.net/2025-03-21-codecompanion-neovim-ai-coding
	{ "olimorris/codecompanion.nvim",
	  dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	  },
	  opts = function(_, opts)
		-- 環境に依存しない設定
		local base_opts = {
			languages = "Japanese"
		}
		-- 環境ごとに切り分けたい設定
		local env_opts = require("envs.code-companion").opts

		-- デフォルト設定 -> 環境に依存しない設定 -> 環境に依存する設定 の順にマージ
		return vim.tbl_deep_extend("force", opts, base_opts, env_opts)
	  end,
  }
}
