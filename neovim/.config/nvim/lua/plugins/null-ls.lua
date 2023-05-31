return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		-- This is where you modify the settings for lsp-zero
		-- Note: autocompletion settings will not take effect

		require('null-ls').setup({
			sources = {
				-- Replace these with the tools you have installed
				require('null-ls').builtins.formatting.prettier,
				require('null-ls').builtins.diagnostics.eslint,
			}
		})
	end
}
