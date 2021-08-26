-- Set status line options.
options = {
  theme = 'gruvbox'
}

-- Temporary fix to prevent the status line from vanishing on configuration reload.
require("plenary.reload").reload_module("lualine", true)

-- Enable the lualine status line.
require('lualine').setup(options)
