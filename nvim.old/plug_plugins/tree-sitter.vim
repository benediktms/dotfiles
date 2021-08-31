if exists('g:installing_plugins')

  " Tree sitter
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

  finish
endif

lua <<EOF

require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  incremental_selection = { enable = true },
  -- indent = { enable = true },
}

EOF
