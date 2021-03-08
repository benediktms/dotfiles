" Plugins ----------------------------------------

call plug#begin('~/.local/share/plugged')

let g:installing_plugins = 1

for file in split(glob(g:vimdir . '/plug_plugins/*.vim'), '\n')
  exe 'source' fnameescape(file)
endfor

unlet g:installing_plugins

packloadall

call plug#end()

let g:gruvbox_invert_selection='0'
let g:gruvbox_italic = 1
let g:gruvebox_contrast_dark = 0
colorscheme gruvbox

" Let Coc handle LSP and ALE diagnostics
let ale_disable_lsp = 1

