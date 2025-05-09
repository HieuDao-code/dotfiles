-- Bootstrap lazy.nvim
-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Setup lazy.nvim
require('lazy').setup {
  spec = 'hieu.plugins',
  -- automatically check for plugin updates
  -- checker = { enabled = true },
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
}

-- -- LSP activation (references lsp/<filename>)
-- -- Check out mason.lua to see the LSP installed
-- local lsp_dir = vim.fn.stdpath 'config' .. '/lsp'
-- local lsp_servers = {}
--
-- if vim.fn.isdirectory(lsp_dir) == 1 then
--   for _, file in ipairs(vim.fn.readdir(lsp_dir)) do
--     if file:match '%.lua$' and file ~= 'init.lua' then
--       local server_name = file:gsub('%.lua$', '')
--       table.insert(lsp_servers, server_name)
--     end
--   end
-- end
-- vim.lsp.enable(lsp_servers)

require 'hieu.config.options'
require 'hieu.config.autocmds'
require 'hieu.config.keymaps'
