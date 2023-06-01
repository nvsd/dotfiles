return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		require('null-ls').setup({
			sources = {
				require('null-ls').builtins.formatting.prettier,
				require('null-ls').builtins.diagnostics.eslint,
				require("typescript.extensions.null-ls.code-actions"),
			}
		})
	end
}
