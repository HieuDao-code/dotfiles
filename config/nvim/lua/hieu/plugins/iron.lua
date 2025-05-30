-- Interactive REPL (Read Eval Print Loop)
return {
  'Vigemus/iron.nvim',
  lazy = true,
  ft = 'python',
  config = function()
    local iron = require 'iron.core'
    local view = require 'iron.view'
    local common = require 'iron.fts.common'

    iron.setup {
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          python = {
            command = { 'python3' }, -- or { "ipython", "--no-autoindent" }
            format = common.bracketed_paste_python,
            block_dividers = { '# %%', '#%%' },
          },
        },
        -- How the repl window will be displayed
        repl_open_cmd = view.right(60),
      },
      -- Iron doesn't set keymaps by default anymore.
      -- You can set them here or manually add keymaps to the functions in iron.core
      keymaps = {
        send_motion = '<space>rc',
        visual_send = '<space>rc',
        send_file = '<space>rf',
        send_line = '<space>rl',
        send_mark = '<space>rms',
        mark_motion = '<space>rmc',
        mark_visual = '<space>rmc',
        remove_mark = '<space>rmd',
        cr = '<space>r<cr>',
        interrupt = '<space>r<space>',
        exit = '<space>rq',
        clear = '<space>rx',
      },
      -- If the highlight is on, you can change how it looks
      -- For the available options, check nvim_set_hl
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
    }

    -- iron also has a list of commands, see :h iron-commands for all available commands
    vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
    vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
    vim.keymap.set('n', '<space>rF', '<cmd>IronFocus<cr>')
    vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
  end,
}
