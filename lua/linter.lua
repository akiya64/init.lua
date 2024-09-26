require('lint').linters_by_ft = {
    markdown = {'vale'},
	javascript = {'eslint'},
	typescript = {'eslint'},
	typescriptreact = {'eslint'},
	php = {'phpstan',}
}

vim.diagnostic.config({virtual_text = false, float={source=true},signs=false})

local diagnostic_hover_augroup_name = "lspconfig-diagnostic"
vim.api.nvim_set_option('updatetime', 500)
vim.api.nvim_create_augroup(diagnostic_hover_augroup_name, { clear = true })
vim.api.nvim_create_autocmd(
	{ "CursorHold" },
	{
		group = diagnostic_hover_augroup_name,
		callback = function()
			vim.diagnostic.open_float()
		end
	}
)
