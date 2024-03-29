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
		local lsp = require('lsp-zero')
		local lspconfig = require("lspconfig")
		local telescope = require('telescope.builtin')

		local function filter(arr, fn)
			if type(arr) ~= "table" then
				return arr
			end

			local filtered = {}
			for k, v in pairs(arr) do
				if fn(v, k, arr) then
					table.insert(filtered, v)
				end
			end

			return filtered
		end

		local function filterDTS(value)
			return string.match(value.filename, '%.d.ts') == nil
		end

		local function on_list(options)
			local items = options.items
			if #items > 1 then
				items = filter(items, filterDTS)
			end

			vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
			vim.api.nvim_command('cfirst') -- or maybe you want 'copen' instead of 'cfirst'
		end

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		lsp.on_attach(function(client, bufnr)
			local nmap = function(keys, func, desc)
				vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
			end

			nmap('<leader>lr', vim.lsp.buf.rename, 'Rename')
			nmap('<leader>la', vim.lsp.buf.code_action, 'Code action')
			nmap('<leader>D', vim.lsp.buf.type_definition, 'Goto type definition')
			nmap('K', vim.lsp.buf.hover, 'Hover documentation')
			nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature documentation')
			nmap('gr', telescope.lsp_references, 'Goto references')
			nmap('<leader>ds', telescope.lsp_document_symbols, 'Document symbols')
			nmap('<leader>ws', telescope.lsp_dynamic_workspace_symbols,
				'Workspace symbols')

			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition { on_list = on_list } end, bufopts)
		end)

		vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
			vim.lsp.diagnostic.on_publish_diagnostics,
			{ update_in_insert = true }
		)


		lsp.on_attach(function(client, bufnr)
			lsp.default_keymaps({buffer = bufnr})
		end)

		lsp.format_on_save({
			format_opts = {
				async = false,
				timeout_ms = 10000,
			},
			servers = {
				['lua_ls'] = {'lua'},
				['rust_analyzer'] = {'rust'},
				['null-ls'] = {'javascript', 'typescript', 'typescriptreact'},
			}
		})

lsp.setup()


		lsp.setup()
	end
}
