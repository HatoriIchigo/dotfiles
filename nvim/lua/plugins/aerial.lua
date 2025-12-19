--
-- aerial.lua
--
--

require('aerial').setup({
  backends = { 'lsp', 'markdown' },
  max_width = { 80, 0.5 },
  width = 30,
  min_width = 30,
  placement = 'edge',
})
