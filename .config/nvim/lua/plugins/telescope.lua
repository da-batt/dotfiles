return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
	{
	    "<Leader>ff",
	    function()
		require("telescope.builtin").find_files()
	    end
	},
	{
	    "<Leader>fg",
	    function()
		require("telescope.builtin").live_grep()
	    end
	}
    }
}
