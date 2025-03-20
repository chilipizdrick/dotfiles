return {
  "lukas-reineke/indent-blankline.nvim",

  enabled = true,

  main = "ibl",

  opts = {
    debounce = 100,
    indent = {
      char = "▏",
      tab_char = "▏",
    },
    scope = {
      show_start = false,
      show_end = false,
    },
  },
}
