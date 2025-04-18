-- Collection of various small independent plugins/modules
return {
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    require('mini.ai').setup {
      mappings = {
        -- Disable some default mappings
        around_next = '',
        inside_next = '',
        around_last = '',
        inside_last = '',
      },
      n_lines = 500,
    }

    --Move any selection in any direction
    require('mini.move').setup()

    -- Mini icons
    require('mini.icons').setup()

    -- Simple and easy statusline.
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }


    -- Snippets Engine
    require('mini.snippets').setup()

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    require('mini.surround').setup {
      mappings = {
        add = 'ys',
        delete = 'ds',
        find = '',
        find_left = '',
        highlight = '',
        replace = 'cs',
        update_n_lines = '',

        -- Add this only if you don't want to use extended mappings
        suffix_last = 'l',
        suffix_next = 'n',
      },
      search_method = 'cover_or_next',
    }

    -- Remap adding surrounding to Visual mode selection
    vim.keymap.del('x', 'ys')
    vim.keymap.set('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })
    -- Make special mapping for "add surrounding for line"
    vim.keymap.set('n', 'yss', 'ys_', { remap = true })
  end,
}
