require('lualine').setup{
	options = {
		theme = 'onelight',
		icons_enabled = false,
		section_separators = {left = '', right=''}
	},
	sections = {
		lualine_c = {  {'filename', path = 1, icon='', icons_enabled = false }},
		lualine_x = { 'diagnostics' }
	},
}

