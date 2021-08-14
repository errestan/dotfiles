-- Set the line width.
vim.o.textwidth = 110

-- Show a vertical line at the maximum line length.
vim.o.colorcolumn = "110"

-- Always use UTF-8.
vim.o.encoding = 'utf-8'

-- Enable relative line numbering.
vim.o.number = true
vim.o.relativenumber = true

-- Highlight the current line.
vim.o.cursorline = true

-- Scroll the window before the cursor hits the top or bottom.
vim.o.scrolloff = 5

-- Enable spell checker.
vim.o.spell = true
vim.o.spelllang = 'en_gb'

-- Allow modified buffers to be hidden.
vim.o.hidden = true

-- Configure tab behaviour.
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- Always show the gutter.
vim.o.signcolumn = "yes"
