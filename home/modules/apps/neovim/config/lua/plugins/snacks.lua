return {
  "folke/snacks.nvim",

  enabled = false,

  lazy = false,

  priority = 1000,

  event = "VimEnter",

  opts = {
    quickfile = {
      enabled = true,
    },
    bigfile = {
      enabled = true,
    },
  },
}
