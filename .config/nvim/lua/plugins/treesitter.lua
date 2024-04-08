return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
	local configs = require("nvim-treesitter.configs")

	configs.setup({
	    ensure_installed = { "lua", "html", "bash", "css", "javascript", "typescript", "tsx", "yaml" },
	    highlight = { enable = true },
	    indent = { enable = true },
	    autotag = { enable = true }
	})

    end
}
