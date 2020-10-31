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
let g:syntastic_c_compiler = '~/.local/bin/gcc-wrapper'
let g:syntastic_asm_compiler = '~/.local/bin/gcc-wrapper'

" Set the name of the configuration file Syntastic will use to find C and CPP
" flags for C files.
let g:syntastic_c_config_file = '.syntastic_c_config'
