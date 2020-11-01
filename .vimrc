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

" set cursor line
set cursorline

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

Plug 'preservim/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" File tree with NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Open NERDTree
nnoremap <leader>ft :NERDTreeToggle<CR>
" let g:NERDTreeGitStatusIndicatorMapCustom = {
"     \ "Modified"  : "✹",
"     \ "Staged"    : "✚",
"     \ "Untracked" : "✭",
"     \ "Renamed"   : "➜",
"     \ "Unmerged"  : "═",
"     \ "Deleted"   : "",
"     \ "Dirty"     : "✗",
"     \ "Clean"     : "✔︎",
"     \ 'Ignored'   : '☒',
"     \ "Unknown"   : "?"
"     \ }

" IDE like intellisense with Coc -----------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

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

Plug 'pantharshit00/vim-prisma'
" ------------------------------------------------

" IDE like linting and diagnostics
Plug 'dense-analysis/ale'
let b:ale_fixers = {'javascript': ['prettier', 'eslint'], 'ruby': ['prettier']}
let g:ale_fix_on_save = 1

Plug 'prettier/vim-prettier'
nnoremap <leader>pp :PrettierAsync<CR>

" Git gutter information
Plug 'airblade/vim-gitgutter'
" let g:gitgutter_sign_added = '✚'
" let g:gitgutter_sign_modified = '✹'
" let g:gitgutter_sign_removed = '-'
" let g:gitgutter_sign_removed_first_line = '-'
" let g:gitgutter_sign_modified_removed = '-'

" Color scheme
Plug 'morhetz/gruvbox'

" Lightline
" Plug 'itchyny/lightline.vim'
" set laststatus=2

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1

" Git awesomeness
Plug 'tpope/vim-fugitive'

" fzf search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files <CR>

" Language specific ----------------------------
" JavaScript syntac highlighting
Plug 'pangloss/vim-javascript'

" TypeScript syntac highlighting
Plug 'leafgarland/typescript-vim'

" JSX/TSX syntac highlighting
Plug 'MaxMEllon/vim-jsx-pretty'

call plug#end()
" -----------------------------------------------

" color scheme
" let g:gruvbox_italic=1
colorscheme gruvbox
