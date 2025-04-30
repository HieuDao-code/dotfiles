return {
  cmd = { 'basedpyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'pyrightconfig.json',
    '.git',
  },
  settings = {
    basedpyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
      analysis = {
        diagnosticSeverityOverrides = {
          -- https://docs.basedpyright.com/v1.20.0/configuration/language-server-settings/
          -- Overwrite Rules which clash with Ruff to keep the Type checking from Pyright
          reportUndefinedVariable = 'none',
        },
        exclude = { 'cdk.out', '.tox' },
      },
    },
  },
}
