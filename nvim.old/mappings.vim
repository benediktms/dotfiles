" Generic shortcuts ------------------------------

" setting leader key and shortcuts
let mapleader = " "

" setting up better buffer navigation
nnoremap <a-j> :bp<CR>
nnoremap <a-k> :bn<CR>

" buffer resizing
function! ResizeSection()
  exec "vertical resize ".(&columns / 3). " N"
endfunction
nnoremap <leader>r :call ResizeSection()<CR>

" creating splits (mirrors tmux config for max muscle memory goodness)
nnoremap <leader>- <C-w>s
nnoremap <leader>_ <C-w>v
nnoremap <leader>x <C-w>c
nnoremap <leader>X :bd<CR>

" split navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" exit the nvim terminal emulator
:tnoremap <Esc> <C-\><C-n>

" shortcut to open a vertical split and edit the vimrc/nvim config
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" source configs
nnoremap <leader>sv :source $MYVIMRC<CR>
