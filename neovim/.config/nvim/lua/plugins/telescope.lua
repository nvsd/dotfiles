return {
	'nvim-telescope/telescope.nvim',
	version = '*',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		require('telescope').setup {
			defaults = {
				file_ignore_patterns = { "target/.*" },
				mappings = {
					i = {
						['<C-u>'] = false,
						['<C-d>'] = false,
					},
				},
			},
		}
		pcall(require('telescope').load_extension, 'fzf')
	end
}
