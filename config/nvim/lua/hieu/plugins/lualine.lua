-- Statusline

-- Gitdiff via gitsign
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

-- Get current venv, check current venv when entering buffer
vim.api.nvim_create_autocmd('BufEnter', {
  group = vim.api.nvim_create_augroup('python venv', { clear = true }),
  callback = function(_)
    local venv = vim.env.VIRTUAL_ENV
    if venv ~= nil then
      local venv_name = vim.fn.fnamemodify(venv, ':h:t')
      local python_version = vim.fn.system(venv .. '/bin/python --version')
      if python_version ~= nil and string.find(python_version, 'Python') then
        local version = python_version:match '(%d+%.%d+%.%d+)'
        vim.api.nvim_buf_set_var(0, 'venv', ' ' .. version .. ' ' .. venv_name)
      else -- venv doesn't exist but $VIRTUAL_ENV does, e.g. deleted `.venv` folder
        vim.api.nvim_buf_set_var(0, 'venv', ' no venv activated')
      end
    else
      vim.api.nvim_buf_set_var(0, 'venv', ' no venv activated')
    end
  end,
})

local function get_venv()
  return vim.api.nvim_buf_get_var(0, 'venv')
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'echasnovski/mini.nvim',
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
        { 'lsp_status', ignore_lsp = { 'harperls' }, separator = '' },
        { '%=', separator = '' }, -- make the indicator center
      },
      lualine_y = { 'encoding', 'filetype', {
        get_venv,
        cond = function()
          return vim.bo.filetype == 'python'
        end,
      } },
      lualine_z = { 'location' },
    },
    extensions = { 'fugitive', 'lazy', 'mason', 'nvim-dap-ui', 'oil', 'trouble' },
  },
}
