return {
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            {
                "neovim/nvim-lspconfig",
            },
        },
        config = function()
            require("mason").setup()
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({ ensure_installed = { "lua_ls", "rust_analyzer" } })
            local lspconfig = require("lspconfig")
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true
            mason_lspconfig.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({})
                end,

                ["rust_analyzer"] = function()
                    lspconfig.rust_analyzer.setup({})
                end,
                ["cssls"] = function()
                    lspconfig.cssls.setup({
                        capabilities = capabilities,
                        settings = {
                            css = {
                                lint = {
                                    unknownAtRules = "ignore",
                                },
                            },
                        },
                    })
                end,
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        -- Configuration for neovim configs
                        on_init = function(client)
                            local path = client.workspace_folders[1].name
                            if
                                vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc")
                            then
                                return
                            end

                            client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                                runtime = {
                                    version = "LuaJIT",
                                },
                                -- Make the server aware of Neovim runtime files
                                workspace = {
                                    checkThirdParty = false,
                                    library = {
                                        vim.env.VIMRUNTIME,
                                        -- Depending on the usage, you might want to add additional paths here.
                                        -- "${3rd}/luv/library"
                                        -- "${3rd}/busted/library",
                                    },
                                },
                            })
                        end,
                        settings = {
                            Lua = {
                                completion = {
                                    callSnippet = "Replace",
                                },
                                format = {
                                    enable = true,
                                    defaultConfig = {
                                        indent_style = "space",
                                        indent_size = "2",
                                    },
                                },
                            },
                        },
                    })
                end,
            })
        end,
    },
}
