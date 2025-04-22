return {
  "ThePrimeagen/refactoring.nvim",

  event = "VeryLazy",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },

  opts = {},

  init = function()
    vim.keymap.set("x", "<leader>rn", vim.lsp.buf.rename)
    vim.keymap.set("x", "<leader>re", "<Cmd>Refactor extract<CR>")
    vim.keymap.set("x", "<leader>rf", "<Cmd>Refactor extract_to_file<CR>")
    vim.keymap.set("x", "<leader>rv", "<Cmd>Refactor extract_var<CR>")
    vim.keymap.set({ "n", "x" }, "<leader>ri", "<Cmd>Refactor inline_var<CR>")
    vim.keymap.set("n", "<leader>rI", "<Cmd>Refactor inline_func<CR>")
    vim.keymap.set("n", "<leader>rb", "<Cmd>Refactor extract_block<CR>")
    vim.keymap.set(
      "n",
      "<leader>rbf",
      "<Cmd>Refactor extract_block_to_file<CR>"
    )
  end,
}
