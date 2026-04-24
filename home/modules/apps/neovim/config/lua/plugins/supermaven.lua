return {
  "supermaven-inc/supermaven-nvim",

  enabled = true,

  event = "VeryLazy",

  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-y>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
    })
  end,

  keys = {
    {
      "<leader>tm",
      "<Cmd>SupermavenToggle<CR>",
      desc = "[T]oggle Super[m]aven autocomplete",
    },
  },
}
