return {
  "stevearc/conform.nvim",

  event = "VeryLazy",

  opts = {
    notify_on_error = true,

    default_format_opts = { lsp_format = "fallback" },

    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },

    formatters_by_ft = {
      lua = { "stylua" },
      cpp = { "clang-format" },
      cc = { "clang-format" },
      h = { "clang-format" },
      python = { "pyright" },
      nix = { "alejandra" },
      go = { "gofmt" },
      typst = { "typstyle" },
      json = { "fixjson" },
    },
  },

  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "n",
      desc = "[F]ormat buffer",
    },
  },
}
