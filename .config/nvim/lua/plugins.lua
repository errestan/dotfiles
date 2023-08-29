-- Automatically install Packer if it isn't already installed.
local install_url = "https://github.com/wbthomason/packer.nvim"
local install_dir = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_dir)) > 0 then
    vim.fn.system({ 'git', 'clone', install_url, install_dir })
    vim.api.nvim_command("packadd packer.nvim")
end

-- Automatically update when plugins.lua is written to.
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost',
    { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })

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
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/nvim-cmp'

    -- LSP Formatting.
    use "lukas-reineke/lsp-format.nvim"

    -- Plug-in for Snippet support.
    use 'L3MON4D3/LuaSnip'

    -- Better Tag support.
    use 'ludovicchabant/vim-gutentags'

    -- Git Integration.
    use 'tpope/vim-fugitive'
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    -- Completion formatter.
    use 'onsails/lspkind-nvim'

    -- LSP Utilities.
    use 'tami5/lspsaga.nvim'

    -- Enable tree-sitter.
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- Restore cursor to last place in file.
    use 'farmergreg/vim-lastplace'

    -- Automatic comment and uncomment code.
    use 'numToStr/Comment.nvim'

    -- Colour schemes and themes.
    use { "npxbr/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } }
    use "mjlbach/onedark.nvim"
    use { "tjdevries/gruvbuddy.nvim", requires = { "tjdevries/colorbuddy.vim" } }

    -- Plugin to reload NeoVim cofiguration.
    use {
        'famiu/nvim-reload', requires = { 'nvim-lua/plenary.nvim' }
    }

    -- Telescope: fuzzy searching plugin.
    use {
        'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' }
    }

    -- Telescope extension to use FZF as the fuzzy finder.
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Buffer Line.
    use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }

    -- Status line plugin.
    use { 'hoob3rt/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

    -- Plug-in to show indentation levels.
    use 'lukas-reineke/indent-blankline.nvim'

    -- Mason LSP Server and code formatter manager.
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- Rust Development.
    use 'simrat39/rust-tools.nvim'

    -- NULL Language Server, for Python formatting.
    use { 'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim' } }
end

-- Wrap the plugin function and options in a table.
spec = {
    plugin_list,
    config = options
}

-- Initialise the Packer package manager.
require('packer').startup(spec)
