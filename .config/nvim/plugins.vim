"
"  Vim-plug Installation and setup.
"

" If vim-plug isn't installed, download it.
if empty(glob("~/.config/nvim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.config/nvim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

"
" Declare plug-ins.
"

" List Plugins to be installed.
silent! if plug#begin()
    " NERD Tree
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " Vim-airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Allow tmux to share airline appearance.
    Plug 'edkolev/tmuxline.vim'

    " Restore cursor to last place in file.
    Plug 'farmergreg/vim-lastplace'

    " FZF - Fuzzy find plug-ins.
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Git plug-in.
    Plug 'tpope/vim-fugitive'

    " Comment plug-in.
    Plug 'tpope/vim-commentary'

    " Python code formatter.
    Plug 'psf/black', { 'tag': '19.10b0' }

    Plug 'morhetz/gruvbox'

    " NeoVIM LSP configuration.
    Plug 'neovim/nvim-lspconfig'
    call plug#end()
endif
