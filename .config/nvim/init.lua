-- General configuration.
require('general')

-- Configure plugin manager and plugins.
require('plugins')

-- Setup built-in LSP client.
require('lsp')

-- Configure colours and theme.
require('colours')

-- Enable Comment.nvim.
require('Comment').setup()

-- Configure installed plug-ins.
require('completion')
require('fuzzy-find')
require('git')
require('buffer-line')
require('status-line')
require('tree-sitter')

-- Misc configuration.
require('misc')

-- Configure key mappings.
require('mappings')

-- Source a local configuration file it exists.
utils = require('utils')
utils.source_if_exists("init.local.lua")
