-- Switch back and forth between virtual environments without restarting neovim

-- This function gets called by the plugin when a new result from fd is received
-- You can change the filename displayed here to what you like.
-- Here in the example for linux/mac we replace the home directory with '~' and remove the /bin/python part.
local function shorter_name(filename)
  return filename:gsub(os.getenv 'HOME', '~'):gsub('/bin/python', '')
end

return {
  'linux-cultist/venv-selector.nvim',
  lazy = false,
  dependencies = {
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-dap-python', --optional, switch python path for dap when you switch venv
    'nvim-telescope/telescope.nvim',
  },
  branch = 'regexp', -- This is the regexp branch, use this for the new version
  keys = {
    { '<leader>v', '<cmd>VenvSelect<cr>', desc = '[V]env select (Python)' },
  },
  opts = {
    options = {
      on_telescope_result_callback = shorter_name,
      enable_default_searches = false,
    },
    search = {
      cwd_search = {
        command = "$FD '/bin/python$' $CWD --full-path --color never -HI -a -L -E /proc -E .git/ -E site-packages/ -E cdk.out/ -E .tox/",
      },
      workspace_search = {
        command = "$FD '/bin/python$' $WORKSPACE_PATH --full-path --color never -HI -a -L -E /proc -E .git/ -E site-packages/ -E cdk.out/ -E .tox/",
      },
    },
  },
}
