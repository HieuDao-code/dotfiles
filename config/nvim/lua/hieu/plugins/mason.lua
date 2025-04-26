-- Install all LSP, DAP, Linter and Formatter
return {
  { 'williamboman/mason.nvim', opts = {}, keys = {
    { '<leader>M', '<cmd>Mason<CR>', desc = '[M]ason Menu' },
  } },
  {
    -- Ensure the servers and tools above are installed
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      ensure_installed = {
        'stylua', -- Used to format Lua code
        'ruff', -- Used to lint and format Python code
        'prettier', -- Prettier is an opinionated code formatter for JSON, YAML, Markdown
        'taplo', -- Used to lint and format toml files
      },
    },
  },

  -- Install language server
  -- checkout :help lspconfig-all for default configs
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
    opts = {
      ensure_installed = {
        'lua_ls', -- Lua
        'basedpyright', -- Python
        'ruff', -- Python
        'marksman', -- Markdown
        'yamlls', -- YAML
        'taplo', -- TOML
        'harper_ls', -- English grammar
      },
    },
  },
}
