return {
  'tmsvg/pear-tree',
  event = 'InsertEnter', -- optional: load only when you start typing
  init = function()
    -- Pear-tree is configured through global variables.
    -- Use `init` (not `config`) so they're set before the plugin loads.
    vim.g.pear_tree_smart_openers = 1
    vim.g.pear_tree_smart_closers = 1
    vim.g.pear_tree_smart_backspace = 1
  end,
}
