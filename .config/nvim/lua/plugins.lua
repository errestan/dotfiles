-- Automatically install Packer if it isn't already installed.
local install_url = "https://github.com/wbthomason/packer.nvim"
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', install_url, install_path})
  vim.api.nvim_command("packadd packer.nvim")
end

-- Automatically update when plugins.lua is written to.
vim.cmd("autocmd BufWritePost plugins.lua source <afile> | PackerCompile")

options = {
    git = {
        subcommands = {
            install = "clone --no-single-branch --progress",
            fetch = "fetch --progress"
        },
        default_url_format = "http://github.com/%s"
    },
    display = {
        open_fn = require('packer.util').float,
    }
}

-- Function containing plug-ins to install.
plugin_list = function()
    -- Let Packer manage itself.
    use 'wbthomason/packer.nvim'

    -- NeoVim LSP configuration.
    use 'neovim/nvim-lspconfig'

    -- LSP Auto-completion.
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- Completion formatter.
    use 'onsails/lspkind-nvim'
--
    -- LSP Utilities.
    use 'tami5/lspsaga.nvim'

    -- Enable tree-sitter.
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Restore cursor to last place in file.
    use 'farmergreg/vim-lastplace'

    -- Automatic comment and uncomment code.
    -- TODO: Switch to comment.nvim.
    use 'tpope/vim-commentary'

    -- Python code formatter.
    -- TODO: There is a more generic format plug-in.
    use {'psf/black', tag = '19.10b0'}

    -- Colour schemes and themes.
    use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

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

    -- Buffer Line.
    use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}

    -- Status line plugin.
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
end

-- Wrap the plugin function and options in a table.
spec = {
    plugin_list,
    config = options
}

-- Initialise the Packer package manager.
require('packer').startup(spec)
