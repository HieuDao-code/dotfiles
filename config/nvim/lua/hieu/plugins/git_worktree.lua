-- Git worktree https://git-scm.com/docs/git-worktree
-- use bare repository with: git clone --bare <upstream>
-- In worktree menu:
-- <Enter> - switches to that worktree
-- <c-d> - deletes that worktree
-- <c-f> - toggles forcing of the next deletion
return {
  'ThePrimeagen/git-worktree.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local telescope = require 'telescope'
    local ts_worktree = telescope.extensions.git_worktree
    telescope.load_extension 'git_worktree'

    vim.keymap.set('n', '<leader>gw', ts_worktree.git_worktrees, { desc = 'git [W]orktree menu' })
    vim.keymap.set('n', '<leader>gc', ts_worktree.create_git_worktree, { desc = 'git [c]reate worktree ' })
  end,
}
