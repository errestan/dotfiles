"
"  Keyboard Shortcuts.
"

" Set the "Leader" key to space bar.
let mapleader = " "

" Buffer shortcuts.
map <F2> :bp<CR>
map <F3> :bn<CR>

" Set-up code formatters on a per-file-type basis.
" For C files use: Clang-format short cuts for C/C++.
autocmd FileType C map <buffer> <C-K> :pyf /usr/share/clang/clang-format.py<cr>
autocmd FileType C imap <buffer> <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>

" For Python files use: Black.
autocmd FileType python map <buffer> <C-K> :Black<CR>

" Toggle NERD-Tree window.
map <S-e> :NERDTreeToggle<CR>

" Map common commands to leader shortcuts.
map <Leader>w :w<CR>
map <Leader>c :bdel<CR>
map <Leader>r :source $MYVIMRC<CR>

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

" FZF Key-bindings.
noremap <Leader>f :GFiles --recurse-submodules<CR>
noremap <Leader>t :Tags<CR>

