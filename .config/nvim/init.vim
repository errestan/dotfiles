"
"  General configuration.
"

" Always use UTF-8.
set encoding=utf-8

" Enable line numbering.
set number
set relativenumber

" Highlight the current line.
set cursorline

" Scroll the window before cursor hits top or bottom.
set scrolloff=5

" Enable spell checker.
setlocal spell spelllang=en_gb

" Allow modified buffers to be hidden.
set hidden

" Configure tabs.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Enable syntax highlighting.
syntax enable

"
"  Colour configuration.
"

" 24-bit colour support.
set termguicolors

" Select colour scheme.
set background=dark
colorscheme PaperColor

" Set Paper Color Theme settings. Enable bold and italics.
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'allow_bold': 1,
  \       'allow_italic': 1
  \     }
  \   }
  \ }

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

    " Syntax highlighting.
    Plug 'vim-syntastic/syntastic'

    " Python auto-completion.
    Plug 'davidhalter/jedi-vim'

    " FZF - Fuzzy find plug-ins.
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Git plug-in.
    Plug 'tpope/vim-fugitive'

    " Plug-ins to improve tag behaviour.
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'skywind3000/gutentags_plus'

    " Comment plug-in.
    Plug 'tpope/vim-commentary'

    call plug#end()
endif

"
"  Configure NERD-Tree
"

" Move NERD-Tree to the right.
let g:NERDTreeWinPos = "right"

" Close NERD-Tree on file open.
let NERDTreeQuitOnOpen=1

" Open a NERD-Tree window if no file was specified on startup.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close Vim if NERD-Tree is all that is left.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"
"  Configure vim-airline
"

" Enable buffers in tab line.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Use patched powerline fonts.
let g:airline_powerline_fonts = 1

" Show buffer number in status line.
set statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Enable Gutentags integration.
let g:airline#extensions#gutentags#enabled = 1

"
"  Configure Syntastic
"

" Configure syntastic output.
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Make syntastic use a specific python executable. This is to work around the
" Android NDK putting a 'python' binary on the path. This will break if
" editing Python 2 files.
let g:syntastic_python_python_exec = 'python3'

" Use a custom wrapper script to determine which compiler to use for C ans
" Assembly files.
let g:syntastic_c_gcc_compiler = '/home/lclark/Development/bin/gcc-wrapper'
let g:syntastic_asm_compiler = '/home/lclark/Development/bin/gcc-wrapper'
"
"  Configure Gutentags and Gutentags PLUS.
"

" Enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" Generate databases in cache directory.
let g:gutentags_cache_dir = expand('~/.cache/tags')

" Change focus to quick-fix window after search.
let g:gutentags_plus_switch = 1

" Disable default key bindings.
let g:gutentags_plus_nomap = 1

"
"  Keyboard Shortcuts.
"

" Set the "Leader" key to space bar.
let mapleader = " "

" Buffer shortcuts.
map <F2> :bn<CR>
map <F3> :bp<CR>

" Clang-format short cuts for C/C++.
map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>

" Toggle NERD-Tree window.
map <S-e> :NERDTreeToggle<CR>

" Map common commands to leader short-cuts.
map <Leader>w :w<CR>
map <Leader>c :bdel<CR>

" Map short cuts to jump to buffers.
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" Customize tag key bindings.
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
noremap <silent> <leader>gz :GscopeFind z <C-R><C-W><cr>
