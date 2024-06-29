return { -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    debounce = 100,
    indent = {
      char = '▏',
      tab_char = '▏',
    },
    scope = {
      show_start = false,
      show_end = false,
    },
  },
}
