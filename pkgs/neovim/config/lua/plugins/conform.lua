return {
  "stevearc/conform.nvim",

  event = "VeryLazy",

  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },

  opts = {
    notify_on_error = false,
    default_format_opts = {
      lsp_format = "fallback",
    },

    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },

    formatters_by_ft = {
      lua = { "stylua" },
      cpp = { "clang-format" },
      cc = { "clang-format" },
      h = { "clang-format" },
      javascript = { { "prettierd", "prettier" } },
      python = { "black" },
      nix = { "alejandra" },
      bash = { "shfmt" },
      go = { "gofmt" },
      yaml = { "yq" },
      typst = { "typstyle", lsp_format = "fallback" },
      json = { "fixjson" },
      markdown = { "commonmark" },
      -- rust = { "rustfmt", lsp_format = "fallback" },
    },
  },
}
