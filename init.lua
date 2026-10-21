require 'core.options'
require 'core.keymaps'

local lazypath = vim.fn.stdpath 'data' .. 'lazy/lazy.nvim'
local lazypath = vim.fn.stdpath 'data' .. 'lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons', -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    { 'lervag/vimtex', lazy = false },
  },
  require 'plugins.colorscheme',
  require 'plugins.neotree',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.formatting',
  require 'plugins.gitsigns',
  require 'plugins.alpha',
  require 'plugins.luasnip',
  require 'plugins.vimtex',
  require 'plugins.pear-tree',
  require 'plugins.toggleterm',
  require 'plugins.trouble',
}
