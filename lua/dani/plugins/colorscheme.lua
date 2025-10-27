return {
	"rose-pine/neovim",
        priority = 1000, -- make sure to load this before all the other start plugins
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")
	end
}
  --[[[
return {
 {
        "folke/tokyonight.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            local bg = "#000000"
            local bg_dark = "#000000"
            local bg_highlight = "#143652"
            local bg_search = "#0A64AC"
            local bg_visual = "#6457fb"
            local fg = "#CBE0F0"
            local fg_dark = "#B4D0E9"
            local fg_gutter = "#627E97"
            local border = "#547998"

            require("tokyonight").setup({
                --for transparent background
                transparent=true,
                style = "night",
                on_colors = function(colors)
                    colors.bg = bg
                    colors.bg_dark = bg_dark
                    colors.bg_float = bg_dark
                    colors.bg_highlight = bg_highlight
                    colors.bg_popup = bg_dark
                    colors.bg_search = bg_search
                    colors.bg_sidebar = bg_dark
                    colors.bg_statusline = bg_dark
                    colors.bg_visual = bg_visual
                    colors.border = border
                    colors.fg = fg
                    colors.fg_dark = fg_dark
                    colors.fg_float = fg
                    colors.fg_gutter = fg_gutter
                    colors.fg_sidebar = fg_dark
                end,
            })
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight])
        end,
    },
    }
    ]]
-- lua/plugins/rose-pine.lua

