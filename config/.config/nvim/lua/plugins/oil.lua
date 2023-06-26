return {
	-- File explorer
	'stevearc/oil.nvim',
	config = function()
		require("oil").setup({
			view_options = {
				is_hidden_file = function(name)
					return vim.startswith(name, "target")
				end
			}
		})
	end
}
