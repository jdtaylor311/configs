return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = 'v3.x'
    },
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            {
                "folke/neodev.nvim",
                opts = {},
            },
        },
        config = function()
            local cmp = require("cmp")
            local cmp_lsp = require("cmp_nvim_lsp")
            local lspconfig = require("lspconfig")
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities()
            )
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "tsserver",
                    "marksman",
                },
                handlers = {
                    function(server_name)
                        if server_name == "rust_analyzer" then
                            return
                        end
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                        })
                        if server_name == "lua_ls" then
                            lspconfig.lua_ls.setup({
                                capabilities = capabilities,
                                settings = {
                                    Lua = {
                                        completion = {
                                            callSnippet = "Replace",
                                        },
                                        diagnostics = {
                                            globals = { "it", "describe", "before_each", "after_each" },
                                        },
                                    },
                                },
                            })
                        end
                        if server_name == "marksman" then
                            lspconfig.marksman.setup({
                                capabilities = capabilities,
                                settings = {
                                    marksman = {
                                        completion = {
                                            callSnippet = "Replace",
                                        },
                                    },
                                },
                            })
                        end
                    end,
                    require('lsp-zero').default_setup,
                },
            })

            require("neodev").setup({
                library = {
                    plugins = {
                        { "nvim-dap-ui" },
                        types = true,
                    },
                },
            })

            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- For luasnip users.
                    { name = "buffer" },
                }),
            })

            vim.diagnostic.config({
                -- update_in_insert = true,
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })
        end,
    },
}
