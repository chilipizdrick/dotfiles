return {
  "nvim-treesitter/nvim-treesitter",

  branch = "main",

  lazy = false,

  main = "nvim-treesitter",

  build = ":TSUpdate",

  init = function()
    local ensure_installed = {
      "gitcommit",
      "go",
      "json",
      "lua",
      "nix",
      "python",
      "rust",
      "toml",
      "typst",
      "yaml",
      "markdown",
      "c",
      "cpp",
      "bash",
    }
    local already_installed = require("nvim-treesitter.config").get_installed()
    local parsers_to_install = vim
      .iter(ensure_installed)
      :filter(function(parser)
        return not vim.tbl_contains(already_installed, parser)
      end)
      :totable()

    require("nvim-treesitter").install(parsers_to_install)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
