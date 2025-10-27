return{--- de la chat gpt dar am reusit sa o pun eu in alt fisier -------yAAAAAAAAAAAAAAAY
-- Configure diagnostics display
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",  -- could be "■", "▎", "x"
    spacing = 2,
  },
  signs = true,         -- show icons in the gutter
  underline = true,     -- underline offending code
  update_in_insert = false, -- set to true if you want real-time updates
  severity_sort = true,
})
}
