if exists('g:installing_plugins')

  " Tmux statusline generator
  Plug 'edkolev/tmuxline.vim'
  let g:tmuxline_preset = 'powerline'
  let g:airline#extensions#tmuxline#enabled = 0

  finish
endif
