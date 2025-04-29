-- Visualize undo history
return {
  'mbbill/undotree',
  opts = {},
  keys = { { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = '[U]ndotree' } },
}
