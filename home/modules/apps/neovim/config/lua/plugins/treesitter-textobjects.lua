return {
  "nvim-treesitter/nvim-treesitter-textobjects",

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },

  event = "BufEnter",

  config = function()
    require("nvim-treesitter.configs").setup({
      textobjects = {

        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = {
              query = "@function.outer",
              desc = "Select outer function",
            },
            ["if"] = {
              query = "@function.inner",
              desc = "Select inner function",
            },
            ["ac"] = { query = "@class.outer", desc = "Select outer class" },
            ["ic"] = { query = "@class.inner", desc = "Select inner class" },
            ["as"] = {
              query = "@local.scope",
              query_group = "locals",
              desc = "Select language scope",
            },
          },
          selection_modes = {
            ["@parameter.outer"] = "v",
            ["@function.outer"] = "V",
            ["@class.outer"] = "V",
          },
          include_surrounding_whitespace = true,
        },
      },
    })
  end,
}
