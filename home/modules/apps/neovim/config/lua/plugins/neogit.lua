return {
  "NeogitOrg/neogit",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },

  config = true,

  init = function()
    vim.keymap.set("n", "<leader>ng", "<Cmd>Neogit<CR>")
  end,
}
