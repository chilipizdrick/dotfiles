return {
  "folke/todo-comments.nvim",

  dependencies = { "nvim-lua/plenary.nvim" },

  event = "VeryLazy",

  opts = {
    signs = true,
    highlight = {
      pattern = ".*<(KEYWORDS)\\s*[: ]",
    },
  },
}
