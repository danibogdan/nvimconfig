vim.g.mapleader =" "


local keymap= vim.keymap -- for conciseness


-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- autoformatation    ACUTALLY ASA FAC SIA ALTII NUMAI CA EI BAGAGA DIRECT comanda :  gg=G
--keymap.set("n", "<leader>ia", "gg=G<CR>", { noremap=true, silent=true, desc = "INDENT ALL" }) -- close current split window
--errors showing with TELESCOPE ------
keymap.set("n", "<leader>fe", ":Telescope diagnostics<CR>", { desc = "Split window vertically" }) --  "find errors"

-- window management
keymap.set("n", "<leader>sh", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sv", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

--PENTRU ASSEMBLY SA IMI GENEREZE AUTOMAT AIA
keymap.set("n", "<leader>asm", "<ESC>ggI.386<ESC>o.model flat, stdcall<ESC>o<ESC>o;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;<ESC>o;includem msvcrt.lib, si declaram ce functii vrem sa importam<ESC>oincludelib msvcrt.lib<ESC>oextern exit: proc<ESC>o;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;<ESC>o<ESC>o;declaram simbolul start ca public - de acolo incepe executia<ESC>opublic start<ESC>o;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;<ESC>o<ESC>o;sectiunile programului, date, respectiv cod<ESC>o.data<ESC>o.code<ESC>ostart:<ESC>opush 0<ESC>ocall exit<ESC>oend start<ESC>gg", { desc = "autocomplete assembly code" }) --  move current buffer to new tab
