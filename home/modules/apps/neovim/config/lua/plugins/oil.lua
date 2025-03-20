return {
  "stevearc/oil.nvim",

  dependencies = { "nvim-tree/nvim-web-devicons" },

  opts = {
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["\\"] = false,
      ["<Bslash>"] = false,
      ["<C-h>"] = false,
      ["<C-l>"] = false,
    },
  },

  init = function()
    vim.keymap.set(
      "n",
      "<leader>o",
      "<Cmd>Oil<CR>",
      { desc = "Open Oil file explorer" }
    )
  end,
}
