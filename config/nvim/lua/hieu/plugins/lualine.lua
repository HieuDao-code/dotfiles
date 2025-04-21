{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
      } },
opts = {
options = { theme = 'gruvbox-material',
sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename', 'harpoon2'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
section_separators = { left = '\ue0b0', right = '\ue0b2' },
  component_separators = { left = '\ue0b0', right = '\ue0b2' }
}

}
}