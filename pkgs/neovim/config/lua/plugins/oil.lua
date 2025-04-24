return {
  "stevearc/oil.nvim",

  dependencies = { "nvim-tree/nvim-web-devicons", opts = {} },

  event = "VimEnter",

  init = function()
    require("oil").setup({
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["\\"] = false,
        ["<Bslash>"] = false,
        ["<C-h>"] = false,
        ["<C-l>"] = false,
      },
    })
  end,

  keys = {
    { "<leader>o", "<Cmd>Oil<CR>", { desc = "Open Oil file explorer" } },
  },
}
