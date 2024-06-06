return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		'L3MON4D3/LuaSnip',
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		-- Here is where you configure the autocompletion settings.
		-- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
		-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp
		require('lsp-zero.cmp').extend()
		local cmp_action = require('lsp-zero').cmp_action()
		local cmp = require('cmp')

		cmp.setup({
			preselect = 'item',
			sources = {
				{ name = 'path' },
				{ name = 'nvim_lsp' },
				{ name = 'buffer',  keyword_length = 3 },
				{ name = 'luasnip', keyword_length = 2 },
			},
			mapping = {
				['<Tab>'] = cmp_action.luasnip_supertab(),
				['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
				['<CR>'] = cmp.mapping.confirm({ select = false }),
				['<C-Space>'] = cmp.mapping.complete(),
			}
		})
	end
}
