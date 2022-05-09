--  Highlight on yank.
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Indent blankline
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}
