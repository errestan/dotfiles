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
