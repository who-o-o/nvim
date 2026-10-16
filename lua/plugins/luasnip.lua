return {
  'L3MON4D3/LuaSnip',
  version = 'v2.*',
  build = 'make install_jsregexp',
  config = function()
    local ls = require 'luasnip'
    ls.config.set_config {
      enable_autosnippets = true,
      store_selection_keys = '<Tab>',
    }
    require('luasnip.loaders.from_lua').lazy_load {
      paths = vim.fn.stdpath 'config' .. '/LuaSnip/',
    }

    vim.keymap.set({ 'i', 's' }, '<Tab>', function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      else
        vim.api.nvim_feedkeys(vim.keycode '<Tab>', 'n', false)
      end
    end)
    vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
      ls.jump(-1)
    end)
  end,
}
