-- Set the <Leader> key.
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Remap for dealing with word wrap.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Add leader shortcuts for Telescope.
vim.keymap.set('n', '<leader>fb', 
    function()
        require('telescope.builtin').buffers()
    end
)
vim.keymap.set('n', '<leader>ff',
    function()
        require('telescope.builtin').find_files({ previewer = false })
    end
)
vim.keymap.set('n', '<leader>fg',
    function()
        require('telescope.builtin').git_files({ previewer = false, recurse_submodules = true })
    end
)
vim.keymap.set('n', '<leader>fs',
    function()
        require('telescope.builtin').current_buffer_fuzzy_find()
    end
)
vim.keymap.set('n', '<leader>fh',
    function()
        require('telescope.builtin').help_tags()
    end
)
vim.keymap.set('n', '<leader>ft',
    function()
        require('telescope.builtin').tags()
    end
)
vim.keymap.set('n', '<leader>fd',
    function()
        require('telescope.builtin').grep_string()
    end
)
vim.keymap.set('n', '<leader>fp',
    function()
        require('telescope.builtin').live_grep()
    end
)
vim.keymap.set('n', '<leader>fo',
    function()
        require('telescope.builtin').tags({ only_current_buffer = true })
    end
)
vim.keymap.set('n', '<leader>?', 
    function()
        require('telescope.builtin').oldfiles()
    end
)

-- Diagnostic keymaps.
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Clear highlights
vim.keymap.set('n', '<C-l>', '<cmd>noh<CR>')

-- Buffer shortcuts.
vim.keymap.set('n', '<F2>', '<cmd>bp<CR>')
vim.keymap.set('n', '<F3>', '<cmd>bn<CR>')

-- Map common commands to leader shortcuts.
vim.keymap.set('n', '<Leader>w', '<cmd>w<CR>')
vim.keymap.set('n', '<Leader>c', '<cmd>bdel<CR>')
vim.keymap.set('n', '<Leader>r', '<cmd>Reload<CR>')

-- Map short cuts to jump to buffers.
vim.keymap.set('n', '<Leader>1', '<cmd>1b<CR>')
vim.keymap.set('n', '<Leader>2', '<cmd>2b<CR>')
vim.keymap.set('n', '<Leader>3', '<cmd>3b<CR>')
vim.keymap.set('n', '<Leader>4', '<cmd>4b<CR>')
vim.keymap.set('n', '<Leader>5', '<cmd>5b<CR>')
vim.keymap.set('n', '<Leader>6', '<cmd>6b<CR>')
vim.keymap.set('n', '<Leader>7', '<cmd>7b<CR>')
vim.keymap.set('n', '<Leader>8', '<cmd>8b<CR>')
vim.keymap.set('n', '<Leader>9', '<cmd>9b<CR>')
vim.keymap.set('n', '<Leader>0', '<cmd>10b<CR>')
