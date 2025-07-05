-- Autoformatter
return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    notify_on_error = false,
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      -- Conform can also run multiple formatters sequentially
      bash = { 'shfmt' },
      json = { 'prettier' },
      lua = { 'stylua' },
      markdown = { 'prettier' },
      python = {
        -- To fix auto-fixable lint errors.
        'ruff_fix',
        -- To run the Ruff formatter.
        'ruff_format',
        -- To organize the imports.
        'ruff_organize_imports',
      },
      sh = { 'shfmt' },
      terraform = { 'terraform_fmt' },
      ['terraform-vars'] = { 'terraform_fmt' },
      tf = { 'terraform_fmt' },
      toml = { 'taplo' },
      yaml = { 'prettier' },
      zsh = { 'shfmt' },
    },
  },
}
