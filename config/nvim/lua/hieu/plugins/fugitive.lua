-- Vim plugin for Git
return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gg', '<CMD>G<CR>', { desc = 'git Fugitive' })
  end,
}
