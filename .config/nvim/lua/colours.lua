-- Enable 24-bit colour support.
vim.o.termguicolors = true

-- Use the Dark version.
vim.o.background = "dark"

-- vim.g.gruvbox_contrast_dark = "hard"

-- Set colour Scheme.
-- vim.cmd("colorscheme gruvbox")
require('colorbuddy').colorscheme('gruvbuddy')
