-- Automatically install Packer if it isn't already installed.
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- Automatically update when plugins.lua is written to.
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

-- Initialise the Packer package manager.
return require('packer').startup(function()
  -- Let Packer manage itself.
  use 'wbthomason/packer.nvim'

  -- NeoVim LSP configuration.
  use 'neovim/nvim-lspconfig'

  -- LSP Auto-completion.
  use 'hrsh7th/nvim-compe'

  -- LSP Utilities.
  use 'glepnir/lspsaga.nvim'

  -- Enable tree-sitter.
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }

  -- Restore cursor to last place in file.
  use 'farmergreg/vim-lastplace'

  -- Automatic comment and uncomment code.
  use 'tpope/vim-commentary'

  -- Python code formatter.
  use {'psf/black', tag = '19.10b0'}

  -- Colour schemes and themes.
  use 'projekt0n/github-nvim-theme'

  -- Plugin to reload NeoVim cofiguration.
  use {
    'famiu/nvim-reload',
    requires = {'nvim-lua/plenary.nvim'}
  }

  -- Telescope: fuzzy searching plugin.
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- Telescope extension to use FZF as the fuzzy finder.
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  -- Status line plugin.
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
end)
