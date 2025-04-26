-- Statusline

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    {
      'letieu/harpoon-lualine',
      dependencies = {
        {
          'ThePrimeagen/harpoon',
          branch = 'harpoon2',
        },
      },
    },
  },
  opts = {
    options = {
      theme = 'gruvbox',
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', { 'diff', source = diff_source }, 'diagnostics' },
      lualine_c = { { 'filename', path = 1 } },
      lualine_x = {
        {
          'harpoon2',
          indicators = { '1', '2', '3', '4', '5' },
          active_indicators = { '[1]', '[2]', '[3]', '[4]', '[5]' },
          separator = '',
        },
        { '%=', separator = '' }, -- make the indicator center
      },
      lualine_y = { 'encoding', 'filetype' },
      lualine_z = { 'location' },
    },
    extensions = { 'lazy', 'mason', 'nvim-dap-ui', 'oil', 'trouble' },
  },
}
