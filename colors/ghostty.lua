-- Use ANSI palette slots, so Ghostty supplies the colors and updates them live.
-- Keep true color disabled: RGB highlights bypass the terminal's theme palette.
vim.opt.termguicolors = false
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end
vim.g.colors_name = "ghostty"

local function hl(name, fg, bg, style)
    local opts = { ctermfg = fg, ctermbg = bg }
    if style then
        opts.cterm = style
    end
    vim.api.nvim_set_hl(0, name, opts)
end

-- Slots 0–15 are theme-dependent; omit colors to inherit terminal defaults.
hl("Normal")
hl("NormalNC")
hl("NormalFloat")
hl("EndOfBuffer", 8)
hl("NonText", 8)
hl("Whitespace", 8)
hl("SpecialKey", 8)
hl("Comment", 8, nil, { italic = true })
hl("Constant", 5)
hl("String", 2)
hl("Character", 2)
hl("Number", 5)
hl("Boolean", 5)
hl("Float", 5)
hl("Identifier", 6)
hl("Function", 4)
hl("Statement", 1)
hl("Conditional", 1)
hl("Repeat", 1)
hl("Label", 1)
hl("Operator", 3)
hl("Keyword", 1)
hl("Exception", 1)
hl("PreProc", 6)
hl("Type", 3)
hl("Special", 3)
hl("Delimiter", 7)
hl("Underlined", 4, nil, { underline = true })
hl("Ignore", 8)
hl("Error", 1, nil, { bold = true })
hl("Todo", 0, 3, { bold = true })

hl("LineNr", 8)
hl("CursorLineNr", 3, nil, { bold = true })
-- hl("CursorLine", nil, nil, { underline = true })
hl("CursorLine")
hl("SignColumn")
hl("FoldColumn", 8)
hl("Folded", 8)
hl("WinSeparator", 8)
hl("FloatBorder", 8)
hl("FloatTitle", 4, nil, { bold = true })
hl("Visual", nil, nil, { reverse = true })
hl("Search", 0, 3)
hl("IncSearch", 0, 6)
hl("CurSearch", 0, 6)
hl("MatchParen", 3, nil, { bold = true, underline = true })
hl("Pmenu", 7, 0)
hl("PmenuSel", 0, 4)
hl("PmenuSbar", nil, 8)
hl("PmenuThumb", nil, 7)
hl("StatusLine", 7, 0)
hl("StatusLineNC", 8, 0)
hl("TabLine", 8, 0)
hl("TabLineSel", 0, 4)
hl("TabLineFill", 8)
hl("Title", 4, nil, { bold = true })
hl("Directory", 4)
hl("MoreMsg", 2)
hl("ModeMsg", 2, nil, { bold = true })
hl("Question", 2)
hl("WarningMsg", 3)
hl("ErrorMsg", 1)
hl("DiffAdd", 2, nil, { reverse = true })
hl("DiffChange", 3, nil, { reverse = true })
hl("DiffDelete", 1, nil, { reverse = true })
hl("DiffText", 6, nil, { reverse = true })

for name, color in pairs({ Error = 1, Warn = 3, Info = 4, Hint = 6, Ok = 2 }) do
    hl("Diagnostic" .. name, color)
    hl("DiagnosticUnderline" .. name, color, nil, { underline = true })
end
for name, color in pairs({ Bad = 1, Cap = 4, Local = 6, Rare = 5 }) do
    hl("Spell" .. name, color, nil, { underline = true })
end

-- Explicit links also replace built-in Tree-sitter RGB defaults.
local links = {
    ["@variable"] = "Normal",
    ["@variable.builtin"] = "Special",
    ["@variable.parameter"] = "Identifier",
    ["@variable.member"] = "Identifier",
    ["@constant"] = "Constant",
    ["@module"] = "PreProc",
    ["@string"] = "String",
    ["@string.escape"] = "Special",
    ["@character"] = "Character",
    ["@number"] = "Number",
    ["@boolean"] = "Boolean",
    ["@type"] = "Type",
    ["@attribute"] = "PreProc",
    ["@property"] = "Identifier",
    ["@function"] = "Function",
    ["@constructor"] = "Function",
    ["@operator"] = "Operator",
    ["@keyword"] = "Keyword",
    ["@punctuation"] = "Delimiter",
    ["@punctuation.special"] = "Special",
    ["@comment"] = "Comment",
    ["@tag"] = "Statement",
    ["@markup.heading"] = "Title",
    ["@markup.link"] = "Underlined",
    ["@markup.raw"] = "String",
    Added = "DiagnosticOk",
    Changed = "DiagnosticWarn",
    Removed = "DiagnosticError",
    GitSignsAdd = "DiagnosticOk",
    GitSignsChange = "DiagnosticWarn",
    GitSignsDelete = "DiagnosticError",
    TelescopeNormal = "Normal",
    TelescopeBorder = "FloatBorder",
    TelescopeSelection = "Visual",
    TelescopeMatching = "Special",
    NvimTreeNormal = "Normal",
    NvimTreeFolderName = "Directory",
    NvimTreeOpenedFolderName = "Directory",
    NvimTreeRootFolder = "Title",
    NvimTreeIndentMarker = "NonText",
    NvimTreeWinSeparator = "WinSeparator",
    CmpItemAbbr = "Normal",
    CmpItemAbbrDeprecated = "Comment",
    CmpItemAbbrMatch = "Special",
    CmpItemAbbrMatchFuzzy = "Special",
    CmpItemKind = "Type",
    CmpItemMenu = "Comment",
}
for name, target in pairs(links) do
    vim.api.nvim_set_hl(0, name, { link = target })
end
