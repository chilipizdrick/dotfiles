return {
  "sphamba/smear-cursor.nvim",
  enabled = not vim.g.neovide,
  opts = {
    stiffness = 0.7,
    trailing_stiffness = 0.4,
    distance_stop_animating = 0.3,
    legacy_computing_symbols_support = true,
  },
}
