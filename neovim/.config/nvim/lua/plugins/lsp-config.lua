return {
	'neovim/nvim-lspconfig',
	cmd = 'LspInfo',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'williamboman/mason-lspconfig.nvim' },
		{
			'williamboman/mason.nvim',
			build = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
	},
	config = function()
		require('luasnip.loaders.from_vscode').lazy_load()
		local lsp = require('lsp-zero')
		require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

		lsp.on_attach(function(client, bufnr)
			lsp.buffer_autoformat()
			local nmap = function(keys, func, desc)
				vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
			end

			nmap('<leader>lr', vim.lsp.buf.rename, 'Rename')
			nmap('<leader>la', vim.lsp.buf.code_action, 'Code action')

			nmap('gd', vim.lsp.buf.definition, 'Goto definition')
			nmap('gr', require('telescope.builtin').lsp_references, 'Goto references')
			nmap('<leader>D', vim.lsp.buf.type_definition, 'Goto type definition')
			nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document symbols')
			nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
				'Workspace symbols')

			-- See `:help K` for why this keymap
			nmap('K', vim.lsp.buf.hover, 'Hover documentation')
			nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature documentation')
		end)

		-- (Optional) Configure lua language server for neovim
		require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

		lsp.setup()

		vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
			vim.lsp.diagnostic.on_publish_diagnostics,
			{
				underline = true,
				virtual_text = {
					spacing = 5,
					severity_limit = 'Warning',
				},
				update_in_insert = true,
			}
		)
	end
}
