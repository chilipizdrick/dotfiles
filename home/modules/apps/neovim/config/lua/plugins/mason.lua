return {
  "williamboman/mason.nvim",

  event = "VimEnter",

  config = function()
    require("mason").setup({
      ui = {
        border = "rounded",
      },
    })
  end,
}
