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
