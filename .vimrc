" This is the Vim configuration file of Benedikt Schnatterbeck

" Switch on syntax
syntax on

" set hybrid line numbers relative for normal/visual absolute for insert
:set number relativenumber
:augroup numbertoggle
:	autocmd!
:	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
:augroup END

" This might cause some isses if it isn't set (apparently)
set hidden

" setting indentations
set tabstop=2 softtabstop=2
set shiftwidth=2
set smartindent

" setting update time to be shorter
set updatetime=300

" Generic shortcuts ------------------------------

" setting leader key and shortcuts
let mapleader = " "

" window navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" shortcut to open a vertical split and edit the vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Plugins ----------------------------------------

call plug#begin()

" general & QoL
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" File tree with NERDTree
Plug 'preservim/nerdtree'
" start NERDTree if vim was opened in a directory (no file was opened)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open NERDTree
nnoremap <leader>ft :NERDTreeToggle<CR>

" IDE like intellisense with CoC -----------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" ------------------------------------------------

" IDE like linting and diagnostics
" Plug 'dense-analysis/ale'

" Lightline
Plug 'itchyny/lightline.vim'
set laststatus=2

" fzf search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files <CR>

call plug#end()
" -----------------------------------------------
