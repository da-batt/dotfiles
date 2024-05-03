return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
	{
	    "<Leader>sf",
	    function()
		require("telescope.builtin").find_files()
	    end
	},
	{
	    "<Leader>sg",
	    function()
		require("telescope.builtin").live_grep()
	    end
	},
	{
	    "<Leader>sd",
	    function ()
		require("telescope.builtin").diagnostics()
	    end
	}
    }
}
