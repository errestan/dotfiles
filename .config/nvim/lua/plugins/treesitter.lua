return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
      },

      -- Auto-install languages that are not installed
      auto_install = true,

      highlight = {
        enable = true,
      },

      indent = {
        enable = true,
      },
    },
  },
  config = function()
    -- use bash parser for zsh files
    vim.treesitter.language.register('bash', 'zsh')
  end,
}
