vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

--tabs 7 indentation

opt.tabstop = 4 --4 spaces for tabs
opt.shiftwidth = 4 --4 spaces for indent width
opt.expandtab = true --expand tab to spaces
opt.autoindent = true -- copy indent form current line when starting new one

opt.wrap=false


-- search settings
opt.ignorecase = true --ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sesitive


opt.cursorline = true

opt.cursorline=true

-- colors
--
opt.termguicolors= true
opt.background = "dark" --colorschemes wthat can be light or dark wil be made dark

opt.signcolumn = "yes" --show sign column so that text doesn't shift

--backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start postion

--clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true --split vertical window to the rigth 
opt.splitbelow = true --split horizontal window to the bottom


