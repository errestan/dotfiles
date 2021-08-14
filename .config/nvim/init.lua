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

-- Source a local configuration file it exists.
utils = require('utils')
utils.source_if_exists("init.local.lua")
