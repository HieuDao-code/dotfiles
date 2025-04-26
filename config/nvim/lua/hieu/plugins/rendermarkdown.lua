-- Render markdown in Neovim
return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  config = function()
    local markdown = require 'render-markdown'
    markdown.setup {
      completions = { blink = { enabled = true } },
      render_modes = { 'n', 'c', 't' },
    }

    vim.keymap.set('n', '<leader>m', markdown.toggle, { desc = 'Toggle [M]arkdown rendering' })
  end,
}
