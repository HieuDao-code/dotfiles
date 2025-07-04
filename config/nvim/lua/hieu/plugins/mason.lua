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
        -- Linter and Formatter
        'prettier', -- JSON, YAML, Markdown formatter
        'shellcheck', -- Shell linter
        'shfmt', -- Shell formatter
        'stylua', -- Lua formatter
        'trivy', -- Security scanner linter

        -- LSP (need config file in `lsp` folder)
        'basedpyright', -- Python
        'bash-language-server', -- Bash, Zsh, Sh (uses shellcheck and shfmt)
        'harper-ls', -- English grammar
        'lua-language-server', -- Lua
        'marksman', -- Markdown
        'ruff', -- Python (linter and formatter)
        'taplo', -- TOML (linter and formatter)
        'terraform-ls', -- Terraform
        'tflint', -- Terraform (linter)
        'ty', -- Python
        'yaml-language-server', -- YAML
      },
    },
  },
}
