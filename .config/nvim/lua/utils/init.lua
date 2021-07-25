local utils = { }

function utils.map(mode, lhs, rhs, opts)
  -- Alwasy use the `noremap` option.
  local options = {noremap = true}

  -- Options must be a LUA table, so if `opts` is specified extend the options table.
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return utils
