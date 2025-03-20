return {
  "arne314/typstar",

  dependencies = {
    "L3MON4D3/LuaSnip",
    "nvim-treesitter/nvim-treesitter",
  },

  config = function()
    require("typstar").setup {}
  end,

  ft = { "typst" },
}
