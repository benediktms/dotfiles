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
set updatetime=200
set notimeout ttimeout ttimeoutlen=50

" turn off word wrap cos its DISGUSTING
set nowrap

" Generic shortcuts ------------------------------

" setting leader key and shortcuts
let mapleader = " "

" setting up better buffer navigation
nnoremap <a-j> :bp<CR>
nnoremap <a-k> :bn<CR>
nnoremap <c-s> :w<CR>

" buffer resizing
function! ResizeSection()
  exec "vertical resize ".(&columns / 3). " N"
endfunction
nnoremap <leader>r :call ResizeSection()<CR>

" creating splits (mirrors tmux config for max muscle memory goodness)
nnoremap <leader>- <C-w>s
nnoremap <leader>_ <C-w>v
nnoremap <leader>x <C-w>c

" split navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" exit the nvim terminal emulator
:tnoremap <Esc> <C-\><C-n>

" shortcut to open a vertical split and edit the vimrc/nvim config
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" warp commit messages at 72 characters
au FileType gitcommit setlocal tw=72

" Let Coc handle LSP and ALE diagnostics
let ale_disable_lsp = 1

" Plugins ----------------------------------------

call plug#begin()

" general & QoL ---------------------------------

" surround things with things
Plug 'tpope/vim-surround'

" automatic bracket pairs
Plug 'jiangmiao/auto-pairs'

"auto rename XML like tags 
Plug 'AndrewRadev/tagalong.vim'

" highlight yanked area
Plug 'machakann/vim-highlightedyank'

" End wise for ruby
" Plug 'tpope/vim-endwise'

" auto close XML like tags
" Plug 'alvan/vim-closetag'
" let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx'
" let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" let g:closetag_filetypes = 'html,xhtml,phtml'
" let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'
" let g:closetag_emptyTags_caseSensitive = 1
" let g:closetag_regions = {
"     \ 'typescript.tsx': 'jsxRegion,tsxRegion',
"     \ 'javascript.jsx': 'jsxRegion',
"     \ }
" let g:closetag_shortcut = '>'
" let g:closetag_close_shortcut = '<leader>>'

" tmux navigator
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" nnoremap <silent> <C-TAB> :TmuxNavigatePrevious<cr>

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
map <c-c> <Plug>NERDCommenterToggle

" File tree with NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Open NERDTree
nnoremap <leader>ft :NERDTreeToggle<CR>
nnoremap <leader>st :NERDTreeFind<CR>

let g:NERDTreeGitStatusIndicatorMapCustom = {
		\ "Modified"  : "✹",
		\ "Staged"    : "✚",
		\ "Untracked" : "✭",
		\ "Renamed"   : "➜",
		\ "Unmerged"  : "═",
		\ "Deleted"   : "",
		\ "Dirty"     : "✗",
		\ "Clean"     : "✔︎",
		\ 'Ignored'   : '☒',
		\ "Unknown"   : "?"
		\ }
let NERDTreeShowHidden=1

" easy motion is cool but a tthe oment it's causing errors with linting
Plug 'easymotion/vim-easymotion'

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

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ------------------------------------------------

" IDE like linting and diagnostics
Plug 'dense-analysis/ale'
let b:ale_fixers = {
      \'javascript': ['prettier', 'eslint'],
      \'javascriptreact': ['prettier', 'eslint'],
      \'typescript': ['prettier', 'eslint'],
      \'typescriptreact': ['prettier', 'eslint'],
      \'css': ['prettier'],
      \'ruby': ['prettier']
      \}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
nnoremap <leader>pp :PrettierAsync<CR>
packloadall

" Color scheme
Plug 'morhetz/gruvbox'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

" Tmux statusline generator
Plug 'edkolev/tmuxline.vim'
let g:tmuxline_preset = 'powerline'
let g:airline#extensions#tmuxline#enabled = 0

" Git awesomeness
Plug 'tpope/vim-fugitive'

" Git gutter information
Plug 'airblade/vim-gitgutter'
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

" fzf search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
nnoremap <C-p> :FZF<CR>

" vimux - tmux command prompt interaction from vim
Plug 'benmills/vimux'
nnoremap <leader>rc :VimuxPromptCommand<CR>
nnoremap <leader>lc :VimuxRunLastCommand<CR>

" Tree sitter
Plug 'nvim-treesitter/nvim-treesitter'

" Language specific ----------------------------

" syntax support for prisma
Plug 'pantharshit00/vim-prisma'

" JavaScript syntax highlighting
" Plug 'pangloss/vim-javascript'

" TypeScript syntax highlighting
" Plug 'leafgarland/typescript-vim'

" JSX/TSX syntax highlighting
" Plug 'MaxMEllon/vim-jsx-pretty'

" Nvim LSP
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Plug 'nvim-lua/diagnostic-nvim'

call plug#end()
" -----------------------------------------------

" color scheme
let g:gruvbox_italic = 1
let g:gruvebox_contrast_dark = 0

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum]"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum]"
endif

let g:gruvbox_invert_selection='0'

colorscheme gruvbox

" treesitter stuff
lua <<EOF

require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
}

EOF

" language server setup with completion and diagnostics
" lua <<EOF

" local nvim_lsp = require( 'nvim_lsp' )

" local on_attach = function(_, bufnr)
"     vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
"     require'diagnostic'.on_attach()
"     require'completion'.on_attach()

"     -- Mappings.
"     local opts = { noremap=true, silent=true }
"     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
"     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
"     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
"     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
"     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
"     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
"     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
"     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
"     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>kd', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
"   end

" local servers = {'tsserver', 'solargraph', 'html', 'cssls', 'diagnosticls', 'jsonls', 'vimls'}
"   for _, lsp in ipairs(servers) do
"     nvim_lsp[lsp].setup {
"       on_attach = on_attach,
"     }
"   end
" EOF

" " Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" " Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" "map to manually trigger completion
" imap <silent> <c-c> <Plug>(completion_trigger)

" " let g:diagnostic_enable_virtual_text = 1
" let g:diagnostic_virtual_text_prefix = ''
" nnoremap <silent>[g :PrevDiagnosticCycle<CR>
" nnoremap <silent>]g :NextDiagnosticCycle<CR>

