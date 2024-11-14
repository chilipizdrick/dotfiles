return { -- Autoformat
  'stevearc/conform.nvim',
  lazy = true,
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      cpp = { 'clang-format' },
      cc = { 'clang-format' },
      h = { 'clang-format' },
      javascript = { { 'prettierd', 'prettier' } },
      python = { 'black' },
      nix = { 'alejandra' },
      bash = { 'shfmt' },
      go = { 'gofmt' },
      yaml = { 'yq' },
      typst = { 'typstfmt' },
    },
  },
}
