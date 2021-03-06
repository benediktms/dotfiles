let g:lightline = {
      \'active': {
      \ 'left': [ ['mode', 'paste'], 
      \           ['gitbranch', 'readonly', 'modified'], ['filename'] ]
      \},
      \'component_function': {
      \  'gitbranch': 'FugitiveHead',
      \  'filename': 'LightlineFilename',
      \}
      \}

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction
