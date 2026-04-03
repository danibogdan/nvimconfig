return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function()
    require("tiny-inline-diagnostic").setup({
      preset = "modern",
      transparent_cursorline = true,
      options = {
        show_source = {
          enabled = true,
        },
        show_code = true,
        throttle = 20,
        softwrap = 30,
        multilines = {
          enabled = true,
        },
      },
    })

    -- Important: disable Neovim's default inline diagnostic text
    -- so you don't get duplicate diagnostics.
    vim.diagnostic.config({
      virtual_text = false,
    })
  end,
}
