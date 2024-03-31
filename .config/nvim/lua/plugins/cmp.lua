return {
    {
	"L3MON4D3/LuaSnip",
	dependencies = {
	    "saadparwaiz1/cmp_luasnip",
	    "rafamadriz/friendly-snippets"
	}
    },
    {
	"hrsh7th/nvim-cmp",
	dependencies = {
	    "neovim/nvim-lspconfig",
	    "hrsh7th/cmp-nvim-lsp",
	    "hrsh7th/cmp-buffer",
	    "hrsh7th/cmp-path",
	    "hrsh7th/cmp-cmdline",
	},
	config = function()
	    local cmp = require("cmp")
	    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	    require("luasnip.loaders.from_vscode").lazy_load()

	    cmp.event:on(
		'confirm_done',
		cmp_autopairs.on_confirm_done()
	    )

	    cmp.setup({
		snippet = {
		    expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		    end,
		},
		mapping = cmp.mapping.preset.insert({
		    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
		    ['<C-f>'] = cmp.mapping.scroll_docs(4),
		    ['<C-Space>'] = cmp.mapping.complete(),
		    ['<C-e>'] = cmp.mapping.abort(),
		    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = cmp.config.sources({
		    { name = 'nvim_lsp' },
		    -- { name = 'vsnip' }, -- For vsnip users.
		    { name = 'luasnip' }, -- For luasnip users.
		    -- { name = 'ultisnips' }, -- For ultisnips users.
		    -- { name = 'snippy' }, -- For snippy users.
		    }, {
			{ name = 'buffer' },
		})
	    })

	    -- Set configuration for specific filetype.
	    cmp.setup.filetype('gitcommit', {
		sources = cmp.config.sources({
		    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
		    }, {
			{ name = 'buffer' },
		})
	    })

	    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	    cmp.setup.cmdline({ '/', '?' }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
		    { name = 'buffer' }
		}
	    })

	    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	    cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
		    { name = 'path' }
		    }, {
			{ name = 'cmdline' }
		}),
		matching = { disallow_symbol_nonprefix_matching = false }
	    })
	end
    }
}
