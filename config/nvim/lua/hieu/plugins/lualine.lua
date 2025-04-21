{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons',   {
    "letieu/harpoon-lualine",
    dependencies = {
      {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
      }
    },
  } },
opts = {
options = { theme = 'gruvbox-material',
sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename' },
    lualine_x = {'%=', {
            'harpoon2',
            indicators = { '1', '2', '3', '4', '5' },
            active_indicators = { '[1]', '[2]', '[3]', '[4]', '[5]' }},
          },
    lualine_y = {'encoding', 'fileformat', 'filetype'},
    lualine_z = {'location'}
  },
section_separators = { left = '\ue0b0', right = '\ue0b2' },
  component_separators = { left = '\ue0b0', right = '\ue0b2' }
}

}
}