-- Run and interact with tests
return {
  'nvim-neotest/neotest',
  lazy = true,
  ft = 'python',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-neotest/nvim-nio',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    adapters = {
      ['neotest-python'] = {
        -- Extra arguments for nvim-dap configuration
        -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
        dap = { justMyCode = false },
        -- Command line arguments for runner
        -- Can also be a function to return dynamic values
        args = { '--log-level', 'DEBUG' },
        -- Runner to use. Will use pytest if available by default.
        -- Can be a function to return dynamic value.
        runner = 'pytest',
        -- Custom python path for the runner.
        -- Can be a string or a list of strings.
        -- Can also be a function to return dynamic value.
        -- If not provided, the path will be inferred by checking for
        -- virtual envs in the local directory and for Pipenev/Poetry configs
        python = '.venv/bin/python',
        -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
        -- instances for files containing a parametrize mark (default: false)
        pytest_discover_instances = true,
      },
    },
    status = { virtual_text = true },
    output = { open_on_run = true },
  },
  keys = {
    {
      '<leader>tt',
      function()
        require('neotest').run.run(vim.fn.expand '%')
      end,
      desc = '[T]est Run File',
    },
    {
      '<leader>tT',
      function()
        require('neotest').run.run(vim.uv.cwd())
      end,
      desc = '[T]est Run All Test Files',
    },
    {
      '<leader>tr',
      function()
        require('neotest').run.run()
      end,
      desc = '[T]est Run Nearest',
    },
    {
      '<leader>tl',
      function()
        require('neotest').run.run_last()
      end,
      desc = '[T]est Run Last',
    },
    {
      '<leader>ts',
      function()
        require('neotest').summary.toggle()
      end,
      desc = '[T]est Toggle Summary',
    },
    {
      '<leader>to',
      function()
        require('neotest').output.open { enter = true, auto_close = true }
      end,
      desc = '[T]est Show Output',
    },
    {
      '<leader>tO',
      function()
        require('neotest').output_panel.toggle()
      end,
      desc = '[T]est Toggle Output Panel',
    },
    {
      '<leader>tS',
      function()
        require('neotest').run.stop()
      end,
      desc = '[T]est Stop',
    },
    {
      '<leader>tw',
      function()
        require('neotest').watch.toggle(vim.fn.expand '%')
      end,
      desc = '[T]est Toggle Watch',
    },
  },
}
