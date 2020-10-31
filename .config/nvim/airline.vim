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
