return {
  "folke/todo-comments.nvim",

  dependencies = { "nvim-lua/plenary.nvim" },

  event = "VimEnter",

  opts = {
    signs = true,
    highlight = {
      pattern = ".*<(KEYWORDS)\\s*[: ]",
    },
  },
}
