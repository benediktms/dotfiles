" This is the Vim configuration file of Benedikt Schnatterbeck

" copy and paste from system clipboard
" this is used in both VSCode and NeoVim
set clipboard+=unnamedplus
set mouse=a


" check if the vscode instance is running
if exists('g:vscode')
  let mapleader = " "

  call plug#begin()
    Plug 'machakann/vim-highlightedyank'
    Plug 'tpope/vim-surround'
  call plug#end()
else

  let g:vimdir = "~/.dotfiles/nvim.old"

  " Load keymaps
  exec 'source' g:vimdir . "/mappings.vim"

  " Source plugins & configs
  exec 'source' g:vimdir . "/plug.vim"

  " Load misc configurations
  exec 'source' g:vimdir . "/base.vim"
endif
