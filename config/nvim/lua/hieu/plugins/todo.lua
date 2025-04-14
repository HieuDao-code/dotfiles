-- Highlight to-do, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    -- Jump to to-do comments commands
    local todo = require 'todo-comments'
    vim.keymap.set('n', ']t', todo.jump_next, { desc = 'Next todo comment' })
    vim.keymap.set('n', '[t', todo.jump_prev, { desc = 'Previous todo comment' })
  end,
}
