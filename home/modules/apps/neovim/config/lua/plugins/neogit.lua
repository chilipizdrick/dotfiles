return {
  "NeogitOrg/neogit",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },

  config = true,

  keys = {
    {
      "<leader>ng",
      function()
        require("neogit").open()
      end,
      desc = "[N]eo[g]it",
    },
  },

  -- init = function()
  --   require("neogit").setup({})
  --   vim.keymap.set("n", "<leader>ng", "<Cmd>Neogit<CR>")
  -- end,
}
