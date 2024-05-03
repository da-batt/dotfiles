vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)

return {
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            {
                "neovim/nvim-lspconfig",
                dependencies = {
                    {
                        "folke/neodev.nvim",
                        config = true,
                    },
                },
            },
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({ ensure_installed = { "lua_ls" } })
            require("mason-lspconfig").setup_handlers({

                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,

                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        settings = {
                            Lua = {
                                completion = {
                                    callSnippet = "Replace",
                                },
                            },
                        },
                    })
                end,
            })
        end,
    },
}
