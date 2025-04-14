return {
  cmd = { 'harper-ls', '--stdio' },
  filetypes = {
    'c',
    'cpp',
    'cs',
    'gitcommit',
    'go',
    'html',
    'javascript',
    'lua',
    'markdown',
    'python',
    'rust',
    'toml',
    'typescript',
    'cmake',
  },
  settings = {
    ['harper-ls'] = {
      linters = {
        OxfordComma = false,
        SentenceCapitalization = false,
        SpellCheck = false,
      },
    },
  },
}
