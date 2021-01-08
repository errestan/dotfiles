"
"  Configure Black.
"

" Set default line length.
let g:black_linelength = 110

" Automatically run Black when saving Python files.
autocmd BufWritePre *.py execute ':Black'
