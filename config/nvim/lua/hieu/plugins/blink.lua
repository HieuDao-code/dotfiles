-- Autocompletion plugin with a SIMD fuzzy matcher written in Rust
return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets', 'echasnovski/mini.snippets' },
  -- use a release tag to download pre-built binaries
  version = '1.*',
  opts = {
    snippets = { preset = 'mini_snippets' },
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'enter' },
    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
    },
    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
      providers = {
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 1000,
        },
        lsp = {
          name = 'lsp',
          enabled = true,
          module = 'blink.cmp.sources.lsp',
          score_offset = 900,
          -- min_keyword_length = 2,
        },
        snippets = {
          name = 'Snippets',
          module = 'blink.cmp.sources.snippets',
          score_offset = 800,
          opts = {
            -- friendly_snippets = true,
            -- search_paths = { vim.fn.stdpath 'config' .. '/snippets' },
            -- global_snippets = { 'all' },
          },
        },
        path = {
          name = 'Path',
          module = 'blink.cmp.sources.path',
          score_offset = 600,
          -- When typing a path, I would get snippets and text in the
          -- suggestions, want those to show only if there are no path
          -- suggestions
          fallbacks = { 'snippets', 'buffer' },
          -- min_keyword_length = 2,
          opts = {
            trailing_slash = false,
            label_trailing_slash = true,
            get_cwd = function(context)
              return vim.fn.expand(('#%d:p:h'):format(context.bufnr))
            end,
            show_hidden_files_by_default = true,
          },
        },
        buffer = {
          name = 'Buffer',
          enabled = true,
          max_items = 3,
          module = 'blink.cmp.sources.buffer',
          score_offset = 500,
          min_keyword_length = 2,
        },
      },
    },
    signature = { enabled = true },
  },
  opts_extend = { 'sources.default' },
}
