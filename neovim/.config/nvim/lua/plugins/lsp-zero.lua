return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
	lazy = true,
	config = function()
		require('lsp-zero.settings').preset({
			manage_nvim_cmp = {
				set_basic_mappings = true,
				set_extra_mappings = true,
			},
		})
	end
}
