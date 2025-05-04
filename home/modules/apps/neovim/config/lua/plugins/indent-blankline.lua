return {
  "lukas-reineke/indent-blankline.nvim",

  main = "ibl",

  init = function()
    require("ibl").setup({
      debounce = 100,
      indent = {
        char = "▏",
        tab_char = "▏",
      },
      scope = {
        show_start = false,
        show_end = false,
      },
    })
  end,
}
