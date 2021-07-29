-- Set the line width.
vim.bo.textwidth = 110

-- Show a vertical line at the maximum line length.
vim.wo.colorcolumn = "110"

-- Always use UTF-8.
vim.o.encoding = 'utf-8'

-- Enable relative line numbering.
vim.o.number = true
vim.o.relativenumber = true

-- Highlight the current line.
vim.wo.cursorline = true

-- Scroll the window before the cursor hits the top or bottom.
vim.o.scrolloff = 5

-- Enable spell checker.
vim.o.spell = true
vim.o.spelllang = 'en_gb'

-- Allow modified buffers to be hidden.
vim.o.hidden = true

-- Configure tab behaviour.
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true
vim.bo.smartindent = true

-- Enable syntax highlighting.
vim.o.syntax = 'enable'
