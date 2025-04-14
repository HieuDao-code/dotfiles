return {
  'stevearc/oil.nvim',
  opts = {},
  keys = {
    { '-', '<CMD>Oil<CR>', 'n', { desc = 'Open parent directory' } },
  },
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
