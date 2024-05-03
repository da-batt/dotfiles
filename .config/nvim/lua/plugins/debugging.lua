return {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    keys = {
        {
            "<Leader>db",
            function()
                require("dap").toggle_breakpoint()
            end,
        },
    },
    config = function()
        require("dapui").setup()
    end,
}
