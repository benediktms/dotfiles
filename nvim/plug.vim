" Plugins ----------------------------------------

call plug#begin()

let g:installing_plugins = 1

for file in split(glob(g:vimdir . '/plug_plugins/*.vim'), '\n')
  exe 'source' fnameescape(file)
endfor

unlet g:installing_plugins

packloadall

call plug#end()

" load plugin specific settings that have to be configured after the plugin
" has been loaded (after plug#end).
for file in split(glob(g:vimdir . '/plugin_configs/*.vim'), '\n')
  exe 'source' fnameescape(file)
endfor

