-- Initialise Telescope.
local defaults = {
    mappings = {
        i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
        },
    },
}

require('telescope').setup(defaults)

-- Load the FZF extension for Telescope.
require('telescope').load_extension('fzf')
