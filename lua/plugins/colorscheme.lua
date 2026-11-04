return {
  'shaunsingh/nord.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.nord_contrast = true
    vim.g.nord_borders = false
    vim.g.nord_disable_background = true
    vim.g.nord_italic = false
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = false

    -- Make Trouble follow the main window background
    local function fix_trouble_hl()
      vim.api.nvim_set_hl(0, 'TroubleNormal', { link = 'Normal' })
      vim.api.nvim_set_hl(0, 'TroubleNormalNC', { link = 'Normal' })
    end

    -- Reapply whenever the colorscheme is (re)loaded, e.g. by your <leader>bg toggle
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = 'nord',
      callback = fix_trouble_hl,
    })

    -- Load the colorscheme
    require('nord').set()
    fix_trouble_hl() -- set() doesn't fire the ColorScheme event, so call it once here

    -- Toggle background transparency
    local bg_transparent = true

    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      vim.g.nord_disable_background = bg_transparent
      vim.cmd [[colorscheme nord]]
    end

    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  end,
}
