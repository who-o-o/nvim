return {
  'marko-cerovac/material.nvim',
  priority = 1000,
  config = function()
    vim.g.material_style = 'palenight'

    require('material').setup {
      contrast = {
        terminal = false,
        sidebars = false,
        floating_windows = false,
        cursor_line = false,
        lsp_virtual_text = false,
        non_current_windows = false,
        filetypes = {},
      },

      styles = {
        comments = {}, -- e.g. { italic = true }
        strings = {},
        keywords = {},
        functions = {},
        variables = {},
        operators = {},
        types = {},
      },

      plugins = {
        -- "gitsigns",
        -- "nvim-cmp",
        -- "telescope",
        -- "which-key",
        -- ...uncomment the ones you use
      },

      disable = {
        colored_cursor = true,
        borders = false,
        background = true, -- use terminal background
        term_colors = false,
        eob_lines = false,
      },

      high_visibility = {
        lighter = false,
        darker = false,
      },

      lualine_style = 'stealth',
      async_loading = true,
      custom_colors = nil,
      custom_highlights = {},
    }

    vim.cmd 'colorscheme material'
  end,
}
