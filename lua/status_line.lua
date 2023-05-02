require('lualine').setup{
	options = {
		theme = 'onelight',
		section_separators = { left='', right = '' },
		component_separators = { left = '│', right = '│' }
	},
	sections = {
		lualine_b = { {'branch', icon = ''} },
		lualine_c = { {'filename', path = 1 } },
		lualine_x = {},
		lualine_y = { 'filetype' },
		lualine_z = { 'location', 'progress' },
	},
}
