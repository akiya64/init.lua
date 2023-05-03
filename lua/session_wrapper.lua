local session_dir = vim.fn.expand('~/AppData/Local/nvim-data/sessions')

vim.api.nvim_create_user_command('SaveSession', function (opt)
	vim.fn.mkdir(session_dir, 'p')
	vim.api.nvim_command('mksession '..session_dir..'/'..opt.args)
end,
{ nargs = 1 }
)

vim.api.nvim_create_user_command('LoadSession',function (opt)
	vim.api.nvim_command('silent source '..session_dir..'/'..opt.args)
end,
{ nargs = 1 }
)
