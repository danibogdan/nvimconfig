-- lua/dani/plugins/mason.lua
return {
  {
    "mason-org/mason.nvim",
    opts = {},   -- Mason UI/registry
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      -- install these if missing
      ensure_installed = { "lua_ls", "pyright", "tailwindcss","jdtls","clangd","cssmodules_ls","html","cssls","vtsls"},
      -- v2 setting; auto-enable installed servers via vim.lsp.enable()
      automatic_enable = true,
    },
  },

  -- (optional) put per-server settings with the new API:
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Example: Tailwind custom settings
      vim.lsp.config('tailwindcss', {
        settings = {
          tailwindCSS = {
            classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
            includeLanguages = {
              eelixir = "html-eex",
              eruby   = "erb",
              htmlangular = "html",
              templ   = "html",
            },
            lint = {
              cssConflict = "warning",
              invalidApply = "error",
              invalidConfigPath = "error",
              invalidScreen = "error",
              invalidTailwindDirective = "error",
              invalidVariant = "error",
              recommendedVariantOrder = "warning",
            },
            validate = true,
          },
        },
      })
      -- If you want to enable manually instead of auto:
      -- vim.lsp.enable('tailwindcss')
    end,
  },
}
