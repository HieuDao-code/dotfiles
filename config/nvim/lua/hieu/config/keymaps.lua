-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Eye-friendly scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Smart Paste without losing clipboard
vim.keymap.set('x', '<leader>p', [["_dP]])

-- local dark_theme = 'kanagawa-wave'
local dark_theme = 'catppuccin-mocha'
-- local light_theme = 'rose-pine-dawn'
local light_theme = 'catppuccin-latte'
vim.o.background = 'light'
local current_theme = light_theme
if vim.o.background == 'dark' then
  current_theme = dark_theme
else
  current_theme = light_theme
end

vim.cmd.colorscheme(current_theme)

function ToggleTheme()
  if current_theme == light_theme then
    current_theme = dark_theme
    vim.o.background = 'dark'
  else
    current_theme = light_theme
    vim.o.background = 'light'
  end
  vim.cmd.colorscheme(current_theme)
end

vim.api.nvim_set_keymap('n', '<leader>tc', ':lua ToggleTheme()<CR>', { desc = 'Toggle light and dark mode', noremap = true, silent = true })
