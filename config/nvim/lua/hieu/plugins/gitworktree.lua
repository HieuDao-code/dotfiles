-- Git worktree https://git-scm.com/docs/git-worktree
-- use bare repository with: git clone --bare <upstream>
-- In worktree menu:
-- <Enter> - switches to that worktree
-- <c-d> - deletes that worktree
-- <c-f> - toggles forcing of the next deletion
return {
  -- use polarmutex/git-worktree.nvim when converting to snacks.picker
  'ThePrimeagen/git-worktree.nvim',
  enabled = false,
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

    local worktree = require 'git-worktree'

    -- op = Operations.Switch, Operations.Create, Operations.Delete
    -- metadata = table of useful values (structure dependent on op)
    --      Switch
    --          path = path you switched to
    --          prev_path = previous worktree path
    --      Create
    --          path = path where worktree created
    --          branch = branch name
    --          upstream = upstream remote name
    --      Delete
    --          path = path where worktree deleted

    worktree.on_tree_change(function(op, metadata)
      if op == worktree.Operations.Switch then
        print('Switched from ' .. metadata.prev_path .. ' to ' .. metadata.path)
      end
    end)
  end,
}
