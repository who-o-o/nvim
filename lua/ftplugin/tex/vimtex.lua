return {
  'lervag/vimtex',
  lazy = false, -- vimtex shouldn't be lazy-loaded
  ft = 'tex',
  init = function()
    vim.g.vimtex_view_method = 'zathura' -- change to your PDF viewer
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_view_automatic = 0
  end,
  vim.keymap.set('n', '<C-A-b>', ':VimtexCompile', opts),
}
