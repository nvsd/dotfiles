return {
	'windwp/nvim-ts-autotag',
	lazy = false,
	config = function()
		local autotag = require('nvim-ts-autotag')
		autotag.setup({
			autotag = {
				enable = true,
			},

			filetypes = {
				'html', 'htmldjango',
				'javascript', 'javascriptreact', 'jsx',
				'typescript', 'typescriptreact', 'tsx',
				'rescript',
				'svelte',
				'vue',
				'xml',
				'php',
				'markdown',
				'glimmer', 'handlebars', 'hbs'
			},

			skip_tags = {
				'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
				'input', 'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr', 'menuitem'
			}
		})
	end
}
