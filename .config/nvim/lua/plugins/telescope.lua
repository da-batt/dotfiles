return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
	{
	    "<C-p>",
	    function()
		require("telescope.builtin").find_files()
	    end
	}
    }
}
