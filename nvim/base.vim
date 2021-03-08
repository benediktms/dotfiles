" Switch on syntax
syntax on

" enable embedded Lua syntax highlighting
let g:vimsyn_embed= 'lPr'

" set hybrid line numbers relative for normal/visual absolute for insert
:set number relativenumber
:augroup numbertoggle
:	autocmd!
:	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
:augroup END

" set cursor line
set cursorline

" set auto read to refresh open files when they change on the disk
set autoread
au CursorHold * checktime

" This might cause some isses if it isn't set (apparently)
set hidden

" setting indentations
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

" setting update time to be shorter
set updatetime=100
set notimeout ttimeout ttimeoutlen=50

" turn off word wrap cos its DISGUSTING
set nowrap

" enable special characters
set encoding=UTF-8

" warp commit messages at 72 characters
au FileType gitcommit setlocal tw=72

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum]"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum]"
endif

