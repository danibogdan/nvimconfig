-- ~/.config/nvim/lua/plugins/transparent.lua
return {
    {
        "xiyaowong/transparent.nvim",
        config = function()
            require("transparent").setup({
                extra_groups = {
                    -- General UI
                    "Normal", "NormalNC", "NormalFloat", "VertSplit", "WinSeparator",
                    "StatusLine", "StatusLineNC", "EndOfBuffer", "CursorLine", "CursorLineNr",

                    -- NvimTree
                    "NvimTreeNormal", "NvimTreeNormalNC", "NvimTreeEndOfBuffer", "NvimTreeVertSplit",

                    -- Bufferline
                    "BufferLineFill",
                    "BufferLineBackground",
                    "BufferLineTabClose",
                    "BufferLineCloseButton",
                    "BufferLineCloseButtonSelected",
                    "BufferLineBufferVisible",
                    "BufferLineBufferSelected",
                    "BufferLineSeparator",
                    "BufferLineSeparatorSelected",
                    "BufferLineSeparatorVisible",
                    "BufferLineIndicatorSelected",

                    -- Telescope
                    "TelescopeNormal",
                    "TelescopeBorder",
                    "TelescopePromptNormal",
                    "TelescopePromptBorder",
                    "TelescopeResultsNormal",
                    "TelescopeResultsBorder",
                    "TelescopePreviewNormal",
                    "TelescopePreviewBorder",
                -- Tabline (if used)
                "TabLineFill", "TabLine", "TabLineSel"
                },

                exclude_groups = {}, -- groups you want to keep opaque
            })
        end,
    },
}
