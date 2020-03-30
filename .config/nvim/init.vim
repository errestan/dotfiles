"
"  General configuration.
"

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

"
" vim-plug Installation and setup.
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

	" vim-airline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" Allow tmux to share airline appearance.
	Plug 'edkolev/tmuxline.vim'

	" Restore cursor to lst place in file.
	Plug 'farmergreg/vim-lastplace'

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

"
" Keyboard Shortcuts.
"

" Set the "Leader" key to space bar.
let mapleader = " "

" Buffer shortcuts.
map <F2> :bn<CR>
map <F3> :bp<CR>

" Clang-format shortcuts.
map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>

" Toggle NERDTree window.
map <S-e> :NERDTreeToggle<CR>

" Map common commands to leader short-cuts.
map <Leader>s :w<CR>
map <Leader>c :bdel<CR>

