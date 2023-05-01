local options = {
	encoding = 'utf-8',
	fileencoding = 'utf-8',

	tabstop = 4,
	shiftwidth = 4,
	softtabstop = 4,
	clipboard = "unnamedplus",
	autoindent = true,
	smartindent = true,

	splitright = true,
	splitbelow = true,

	listchars={ tab='» ', trail='¬', extends='»', precedes='«', nbsp='%'},
	list = true,

	number = true,

	background = 'light',
	pumblend = 15,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
