"
"  General configuration.
"

" Always use UTF-8.
set encoding=utf-8

" Select colour scheme.
set background=dark
colorscheme PaperColor

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


"
" Python setup.
"

let python_highlight_all=1
syntax on

"
" Vim-plug Installation and setup.
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

    " Restore cursor to lst place in file.
    Plug 'farmergreg/vim-lastplace'

    " Python PEP-8 compliance.
    Plug 'nvie/vim-flake8'

    " Syntax highlighting.
    Plug 'vim-syntastic/syntastic'

    " Python auto-completion.
    Plug 'davidhalter/jedi-vim'

    " FZF - Fuzzy find plug-ins.
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    call plug#end()
endif

"
" Configure Paper Color theme.
"

" Not sure if this is needed.
set t_Co=256
set laststatus=2

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
" Configure NERDTree
"

" Move NERDTree to the right.
let g:NERDTreeWinPos = "right"

" Close NERDTree on file open.
let NERDTreeQuitOnOpen=1

" Open a NERDTree window if no file was specified on startup.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close Vim if NERDTree is all that is left.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"
" Configure vim-airline
"

" Enable buffers in tab line.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Use patched powerline fonts.
let g:airline_powerline_fonts = 1

" Show buffer number in status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

"
" Configure vim-flake8
"

" Show marks in the gutter.
let g:flake8_show_in_gutter = 1

" Show marks in the file.
let g:flake8_show_in_file = 1

" Automatically run flake-8 when saving a python file.
autocmd BufWritePost *.py call flake8#Flake8()
"
" Keyboard Shortcuts.
"

" Set the "Leader" key to space bar.
let mapleader = " "

" Buffer shortcuts.
map <F2> :bn<CR>
map <F3> :bp<CR>

" Clang-format short cuts for C/C++.
map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>

" Toggle NERDTree window.
map <S-e> :NERDTreeToggle<CR>

" Map common commands to leader short-cuts.
map <Leader>s :w<CR>
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
