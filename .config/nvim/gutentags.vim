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

" Source keyboard short-cuts.
source ~/.config/nvim/mappings.vim

" Apply local settings if present.
call SourceIfExists("~/.config/nvim/init.local")
