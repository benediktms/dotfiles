if exists('g:installing_plugins')
  
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  nnoremap <leader>pp :PrettierAsync<CR>

  finish
endif
