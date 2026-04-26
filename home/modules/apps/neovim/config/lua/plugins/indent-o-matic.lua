return {
  "Darazaki/indent-o-matic",

  enabled = true,

  event = "BufEnter",

  opts = {
    max_lines = 2048,
    standard_widths = { 2, 4, 8 },
    skip_multiline = true,
  },
}
