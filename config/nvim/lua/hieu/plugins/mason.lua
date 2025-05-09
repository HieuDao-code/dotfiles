-- Install all LSP, DAP, Linter and Formatter
return {
  { 'mason-org/mason.nvim', opts = {}, keys = {
    { '<leader>M', '<cmd>Mason<CR>', desc = '[M]ason Menu' },
  } },
  {
    -- Ensure the servers and tools above are installed
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'mason-org/mason.nvim' },
    opts = {
      ensure_installed = {
        'prettier', -- Formatter for JSON, YAML, Markdown
        'ruff', -- Python linter and formatter
        'shellcheck', -- Shell linter
        'shfmt', -- Shell formatter
        'stylua', -- Lua formatter
        'taplo', -- TOML linter and formatter
        'trivy', -- Security Scanner
      },
    },
  },

  -- Install language server
  -- checkout :help lspconfig-all for default configs
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = { 'mason-org/mason.nvim', 'neovim/nvim-lspconfig' },
    opts = {
      ensure_installed = {
        'basedpyright', -- Python
        'bashls', -- Bash, Zsh, Sh
        'harper_ls', -- English grammar
        'lua_ls', -- Lua
        'marksman', -- Markdown
        'ruff', -- Python
        'taplo', -- TOML
        'terraformls', -- Terraform
        'tflint', -- Terraform linter
        'yamlls', -- YAML
      },
    },
  },
}
