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

		lspconfig.tailwindcss.setup({
				settings = {
				tailwindCSS = {
					experimental = {
						classRegex = {
							{ "cva\\(([^)]*)\\)",
							 "[\"'`]([^\"'`]*).*?[\"'`]" },
						},
					},
				},
			},
		})

		local MY_FQBN = "arduino:avr:nano"
		lspconfig.arduino_language_server.setup {
			filetypes = { "ino", "cpp", "h" },
			cmd = {
				"arduino-language-server",
				"-cli-config", "~/arduino-cli.yaml",
				"-fqbn",
				MY_FQBN
			}
		}
		require('luasnip.loaders.from_vscode').lazy_load()
		lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

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

		local lsp_formatting = function(bufnr)
			vim.lsp.buf.format({
				filter = function(client)
					return client.name == "null-ls"
				end,
				bufnr = bufnr,
			})
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
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						lsp_formatting(bufnr)
					end,
				})
			end
		end)

		vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
			vim.lsp.diagnostic.on_publish_diagnostics,
			{ update_in_insert = true }
		)


		lsp.setup()
	end
}
