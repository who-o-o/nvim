return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    -- Read the logo file into a table of lines
    local function read_logo(path)
      local lines = {}
      local f = io.open(path, 'r')
      if not f then
        return { 'logo.txt not found' }
      end
      for line in f:lines() do
        -- strip trailing whitespace/CR so centering is accurate
        table.insert(lines, (line:gsub('%s+$', '')))
      end
      f:close()
      return lines
    end
    dashboard.section.header.val = read_logo(vim.fn.stdpath("config") .. "/lua/logo.txt")
    dashboard.section.header.opts.position = 'center'

    dashboard.section.buttons.val = {
      dashboard.button('e', '  New file', '<cmd>ene <CR>'),
      dashboard.button('f', '  Find file', '<cmd>Telescope find_files<CR>'),
      dashboard.button('r', '  Recent files', '<cmd>Telescope oldfiles<CR>'),
      dashboard.button('g', '  Find text', '<cmd>Telescope live_grep<CR>'),
      dashboard.button('c', '  Config', '<cmd>e $MYVIMRC<CR>'),
      dashboard.button('q', '  Quit', '<cmd>qa<CR>'),
    }

    -- Vertical layout: logo at top, buttons pushed to the bottom
    local term_height = vim.fn.winheight(0)
    local header_h = #dashboard.section.header.val
    local buttons_h = #dashboard.section.buttons.val * 2 -- buttons have 1 line spacing
    local footer_h = 1

    local top_padding = 2
    local bottom_padding = 2
    local middle_gap = math.max(1, term_height - top_padding - header_h - buttons_h - footer_h - bottom_padding)

    dashboard.config.layout = {
      { type = 'padding', val = top_padding },
      dashboard.section.header,
      { type = 'padding', val = middle_gap },
      dashboard.section.buttons,
      dashboard.section.footer,
      { type = 'padding', val = bottom_padding },
    }

    alpha.setup(dashboard.config)
  end,
}
