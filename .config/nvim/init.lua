-- General configuration.
require('general')

-- Configure plugin manager and plugins.
require('plugins')

-- Setup built-in LSP client.
require('lsp')

-- Configure colours and theme.
require('colours')

-- Configure installed plug-ins.
require('black')
require('completion')
require('fuzzy-find')
require('buffer-line')
require('status-line')
require('tree-sitter')

-- Configure key mappings.
require('mappings')

-- TODO: Need a way to include a init.lua.local file if it exists.
