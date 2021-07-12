" let g:gruvbox_invert_selection='0'
" let g:gruvbox_italic = 1
" let g:gruvebox_contrast_dark = 0
" colorscheme gruvbox

" colorscheme nord

" let g:sonokai_style = 'atlantis'
" let g:sonokai_diagnostic_text_highlight = 1
" colorscheme sonokai

" if has('termguicolors')
"   set termguicolors
" endif

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum]"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum]"
  set termguicolors
endif

" set background=dark
set t_Co=256

colorscheme dracula
