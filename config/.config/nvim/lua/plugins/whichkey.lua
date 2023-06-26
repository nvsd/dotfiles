return {
	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		local wk = require("which-key")
		wk.setup {}
		wk.register({
			["<leader>"] = {
				f = {
					name = "Find",
				},
				l = {
					name = "LSP",
				},
			},
		})
	end,
}
