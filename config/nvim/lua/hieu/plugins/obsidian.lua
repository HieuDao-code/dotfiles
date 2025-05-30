return {
  -- 'obsidian-nvim/obsidian.nvim',
  -- version = '*', -- recommended, use latest release instead of latest commit
  -- lazy = true,
  -- ft = 'markdown',
  -- -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- -- event = {
  -- --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  -- --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  -- --   -- refer to `:h file-pattern` for more examples
  -- --   "BufReadPre path/to/my-vault/*.md",
  -- --   "BufNewFile path/to/my-vault/*.md",
  -- -- },
  -- dependencies = {
  --   'nvim-lua/plenary.nvim',
  --   'Saghen/blink.cmp',
  --   'nvim-telescope/telescope.nvim',
  --   'nvim-treesitter',
  -- },
  -- opts = {
  --   workspaces = {
  --     {
  --       name = 'personal',
  --       path = '~/vaults/personal',
  --     },
  --     {
  --       name = 'work',
  --       path = '~/vaults/work',
  --     },
  --   },
  --
  --   completion = {
  --     -- Enables completion using nvim_cmp
  --     nvim_cmp = false,
  --     -- Enables completion using blink.cmp
  --     blink = true,
  --   },
  --
  --   -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
  --   -- way then set 'mappings = {}'.
  --   mappings = {
  --     -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
  --     ['gf'] = {
  --       action = function()
  --         return require('obsidian').util.gf_passthrough()
  --       end,
  --       opts = { noremap = false, expr = true, buffer = true },
  --     },
  --     -- Toggle check-boxes.
  --     ['<leader>ch'] = {
  --       action = function()
  --         return require('obsidian').util.toggle_checkbox()
  --       end,
  --       opts = { buffer = true },
  --     },
  --     -- Smart action depending on context: follow link, show notes with tag, or toggle checkbox.
  --     ['<cr>'] = {
  --       action = function()
  --         return require('obsidian').util.smart_action()
  --       end,
  --       opts = { buffer = true, expr = true },
  --     },
  --   },
  --
  --   -- Optional, set to true if you use the Obsidian Advanced URI plugin.
  --   -- https://github.com/Vinzent03/obsidian-advanced-uri
  --   use_advanced_uri = false,
  --
  --   picker = {
  --     -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
  --     name = 'telescope.nvim',
  --     -- Optional, configure key mappings for the picker. These are the defaults.
  --     -- Not all pickers support all mappings.
  --     note_mappings = {
  --       -- Create a new note from your query.
  --       new = '<C-x>',
  --       -- Insert a link to the selected note.
  --       insert_link = '<C-l>',
  --     },
  --     tag_mappings = {
  --       -- Add tag(s) to current note.
  --       tag_note = '<C-x>',
  --       -- Insert a tag at the current location.
  --       insert_tag = '<C-l>',
  --     },
  --   },
  -- },
}
-- ui = { enable = false }, disable to be compatible with rendermarkdown
