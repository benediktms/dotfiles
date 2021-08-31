if exists('g:installing_plugins')

  " vimux - tmux command prompt interaction from vim
  Plug 'benmills/vimux'
  nnoremap <leader>rc :VimuxPromptCommand<CR>
  nnoremap <leader>lc :VimuxRunLastCommand<CR>

  finish
endif
