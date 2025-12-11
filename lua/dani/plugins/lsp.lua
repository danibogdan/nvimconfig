return{
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            'saghen/blink.cmp',
            {
                "folke/lazydev.nvim",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },

        config=function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            vim.lsp.enable('vtsls');

           -- lua_ls: tell it that `vim` is a global
            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
                capabilities = capabilities,
            })
            --require("lspconfig").lua_ls.setup{}
            vim.lsp.enable('lua_ls');
            --require("lspconfig").clangd.setup{}
            vim.lsp.enable('clangd');
            --require("lspconfig").cssmodules_ls.setup{}
            vim.lsp.enable('cssmodules_ls');
            --require("lspconfig").html.setup{}
            --require("lspconfig").html.setup {
            --  capabilities = capabilities,
            --}
            --
            vim.lsp.config('html', {
                capabilities = capabilities,
            })
            vim.lsp.enable('html')

            --require'lspconfig'.cssls.setup {
            --    capabilities = capabilities,
            --}
            --

            vim.lsp.config('cssls', {
                capabilities = capabilities,
            })
            vim.lsp.enable('cssls')

            --vim.lsp.config('jdtls', { cmd = { 'jdtls' } })
            --vim.lsp.enable('jdtls');
            --require'lspconfig'.ts_ls.setup{}
            vim.lsp.enable('custom_elements_ls')

            vim.lsp.config('tailwindcss', {
                settings = {
                    tailwindCSS = {
                        classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
                        includeLanguages = {
                            eelixir = "html-eex",
                            eruby = "erb",
                            htmlangular = "html",
                            templ = "html"
                        },
                        lint = {
                            cssConflict = "warning",
                            invalidApply = "error",
                            invalidConfigPath = "error",
                            invalidScreen = "error",
                            invalidTailwindDirective = "error",
                            invalidVariant = "error",
                            recommendedVariantOrder = "warning"
                        },
                        validate = true
                    }
                }
            })
            vim.lsp.enable('tailwindcss');
        end,
    }
}
