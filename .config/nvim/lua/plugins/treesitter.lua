return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			auto_install = { enable = true },
			ensure_installed = { "lua", "bash", "css", "javascript", "typescript", "c", "vim", "vimdoc", "query" },
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true }
		})
	end
}
