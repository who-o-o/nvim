return {
  'lervag/vimtex',
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = 'zathura' -- change to your PDF viewer
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_view_automatic = 0
  end,
  keys = {
    { '<C-A-b>', '<cmd>VimtexCompile<CR>', desc = 'Vimtex compile' },
    { '<C-A-v>', '<cmd>VimtexView<CR>', desc = 'Vimtex view' },
  },
}
