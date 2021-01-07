"
"  Colour configuration.
"

" 24-bit colour support.
set termguicolors

" Set Paper Color Theme settings. Enable bold and italics.
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'allow_bold': 1,
  \       'allow_italic': 1
  \     }
  \   }
  \ }

" Set GruvBox theme settings.
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'

" Select colour scheme.
set background=dark
colorscheme gruvbox
