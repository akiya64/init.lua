local options = {
	encoding = 'utf-8',
	fileencoding = 'utf-8',

	--guifont = 'Monofur NF IBM Plex:h11',
	guifont = 'IBM Plex Mono:h11',

	tabstop = 4,
	shiftwidth = 4,
	softtabstop = 4,
	clipboard = 'unnamedplus',
	autoindent = true,
	smartindent = true,

	splitright = true,
	splitbelow = true,

	listchars = { tab = '> ', trail = '¬', extends = '»', precedes = '«', nbsp = '%' },
	list = true,

	number = true,

	background = 'light',
	pumblend = 15,

	autochdir = true,

	shell = vim.fn.expand('$HOME/scoop/apps/git/current/bin/bash.exe'),
	shellcmdflag = '-c',
	shellquote=''
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
