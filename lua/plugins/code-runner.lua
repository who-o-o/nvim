return {
  'CRAG666/code_runner.nvim',
  cmd = { 'RunCode', 'RunFile', 'RunProject', 'RunClose', 'CRFiletype', 'CRProjects' },
  keys = {
    vim.keymap.set('n', '<leader>rr', ':RunCode<CR>', { noremap = true, silent = false }),
    vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false }),
    vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false }),
    vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false }),
    vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false }),
    vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false }),
    vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false }),
  }, -- add the mappings you use
  opts = {
    filetype = {
      c = 'cd $dir && gcc $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt',
      cpp = 'cd $dir && g++ $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt',
      python = 'python3 -u',
      ocaml = 'utop',
    },
  },
}
