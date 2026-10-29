return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    -- Original fixed-color palette, kept for reference:
    --[[
    local colors = {
      blue = "#f6c177",
      green = "#3EFFDC",
      violet = "#FF61EF",
      yellow = "#FFDA7B",
      red = "#FF4A4A",
      fg = "#c3ccdc",
      bg = "#3f3b4a",
      inactive_bg = "#2c3043",
    }
    ]]

    -- ANSI slots follow Ghostty's palette automatically.
    local colors = {
      blue = 4,
      green = 2,
      violet = 5,
      yellow = 3,
      red = 1,
      fg = 7,
      bg = 0,
      -- inactive_bg = 0,
      inactive_bg = 8,
      semilightgray = 8,
    }

    -- Previous background-colored statusline, kept for reference:
    --[[
    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.semilightgray },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
      },
    }

    ]]

    local my_lualine_theme = {}
    for mode, color in pairs({
      normal = colors.blue,
      insert = colors.green,
      visual = colors.violet,
      command = colors.yellow,
      replace = colors.red,
      terminal = colors.green,
    }) do
      my_lualine_theme[mode] = {
        a = { bg = color + 8, fg = colors.bg, gui = "bold" },
        b = { bg = color, fg = colors.bg },
        c = { bg = color, fg = colors.bg },
      }
    end
    my_lualine_theme.inactive = {
      a = { bg = colors.inactive_bg, fg = colors.fg },
      b = { bg = colors.inactive_bg, fg = colors.fg },
      c = { bg = colors.inactive_bg, fg = colors.fg },
    }

    -- Keep a separate statusline below every split.
    vim.opt.laststatus = 2

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = my_lualine_theme,
        globalstatus = false,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            -- color = { fg = "#ff9e64" },
            -- color = { fg = colors.yellow },
            color = { fg = colors.bg },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
