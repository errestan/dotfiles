local function builtin(name, opts)
  return function()
    require('telescope.builtin')[name](opts)
  end
end

return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  dependencies = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-tree/nvim-web-devicons',
    'folke/todo-comments.nvim',
  },
  keys = {
    { '<leader>ff', builtin 'find_files', desc = 'Find files' },
    { '<leader>fb', builtin 'buffers', desc = 'Find buffers' },
    { '<leader>fg', builtin('git_files', { recurse_submodules = true }), desc = 'Find git files' },
    { '<leader>fh', builtin 'help_tags', desc = 'Find help tags' },
    { '<leader>fs', builtin 'current_buffer_fuzzy_find', desc = 'Fuzzy find in buffer' },
    { '<leader>fp', builtin 'live_grep', desc = 'Live grep' },
    { '<leader>fd', builtin 'grep_string', desc = 'Grep string under cursor' },
    { '<leader>fo', builtin('tags', { only_current_buffer = true }), desc = 'Buffer tags' },
    { '<leader>fT', builtin 'tags', desc = 'Find tags (ctags)' },
    { '<leader>fr', builtin 'oldfiles', desc = 'Find recent files' },
    { '<leader>?', builtin 'oldfiles', desc = 'Find recent files' },
    { '<leader>fk', builtin 'keymaps', desc = 'Find keymaps' },
    { '<leader>ft', '<cmd>TodoTelescope<cr>', desc = 'Find todos' },
  },
  config = function()
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'
    local transform_mod = require('telescope.actions.mt').transform_mod

    local trouble = require 'trouble'
    local trouble_telescope = require 'trouble.sources.telescope'

    -- or create your custom action
    local custom_actions = transform_mod {
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle 'quickfix'
      end,
    }

    telescope.setup {
      defaults = {
        path_display = { 'smart' },
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous, -- move to prev result
            ['<C-j>'] = actions.move_selection_next, -- move to next result
            ['<C-q>'] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ['<C-t>'] = trouble_telescope.open,
          },
        },
      },
    }

    telescope.load_extension 'fzf'
  end,
}
