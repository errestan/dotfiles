-- Pull in utility functions.
local utils = require('utils')

-- Set the <Leader> key.
vim.g.mapleader = " "

-- Clear highlights
utils.map('n', '<C-l>', '<cmd>noh<CR>')

-- Buffer shortcuts.
utils.map('n', '<F2>', '<cmd>bp<CR>')
utils.map('n', '<F3>', '<cmd>bn<CR>')

-- Map common commands to leader shortcuts.
utils.map('n', '<Leader>w', '<cmd>w<CR>')
utils.map('n', '<Leader>c', '<cmd>bdel<CR>')
utils.map('n', '<Leader>r', '<cmd>Reload<CR>')

-- Map short cuts to jump to buffers.
utils.map('n', '<Leader>1', '<cmd>1b<CR>')
utils.map('n', '<Leader>2', '<cmd>2b<CR>')
utils.map('n', '<Leader>3', '<cmd>3b<CR>')
utils.map('n', '<Leader>4', '<cmd>4b<CR>')
utils.map('n', '<Leader>5', '<cmd>5b<CR>')
utils.map('n', '<Leader>6', '<cmd>6b<CR>')
utils.map('n', '<Leader>7', '<cmd>7b<CR>')
utils.map('n', '<Leader>8', '<cmd>8b<CR>')
utils.map('n', '<Leader>9', '<cmd>9b<CR>')
utils.map('n', '<Leader>0', '<cmd>10b<CR>')

-- Fuzzy find buffer.
utils.map('n', '<Leader>fb', '<cmd>Telescope buffers<CR>')
utils.map('n', '<Leader>fg', '<cmd>Telescope git_files<CR>')

-- Fuzzy find files tracked by Git.
utils.map('n', '<Leader>fg', '<cmd>Telescope git_files<CR>')

