local action = require('vfiler/action')

require 'vfiler/config'.setup {
	options = {
		columns = 'indent,devicons,name',
		auto_cd = true,
		width = 30
	},
}
