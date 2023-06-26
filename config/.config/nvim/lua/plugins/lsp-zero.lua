return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
	lazy = true,
	config = function()
		local lsp = require('lsp-zero.settings')
		lsp.preset({
			manage_nvim_cmp = {
				set_basic_mappings = true,
				set_extra_mappings = true,
			},
		})
	end
}
