return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  opts = {
    auto_install = true,
    ensure_installed = { "typst", "gitcommit" },
    highlight = {
      enable = true,
    },
  },

  config = function(_, opts)
    require("nvim-treesitter.install").prefer_git = true
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup(opts)
  end,
}
