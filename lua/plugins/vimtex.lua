return {
  'lervag/vimtex',
  lazy = false, -- vimtex shouldn't be lazy-loaded
  init = function()
    vim.g.vimtex_view_method = 'zathura' -- change to your PDF viewer
  end,
}
