return {
	-- Color scheme
	'olimorris/onedarkpro.nvim',
	priority = 1000,
	config = function()
		vim.cmd.colorscheme 'onedark'
	end,
}
