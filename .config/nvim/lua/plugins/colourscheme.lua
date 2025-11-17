return {
  -- Colour schemes and themes.
  {
    "mjlbach/onedark.nvim",
    lazy = false,  },

  -- Colorscheme should be available when starting NeoVim.
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
