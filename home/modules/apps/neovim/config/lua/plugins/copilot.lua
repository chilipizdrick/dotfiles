return {
  "zbirenbaum/copilot.lua",

  enabled = false,

  event = "VimEnter",

  cmd = "Copilot",

  keys = {
    { "<leader>ce", "<Cmd>Copilot enable<CR>", { desc = "Enable Copilot" } },
    { "<leader>cd", "<Cmd>Copilot disable<CR>", { desc = "Enable Copilot" } },
    { "<leader>ct", "<Cmd>Copilot toggle<CR>", { desc = "Toggle Copilot" } },
  },

  config = function()
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
  end,

  init = function()
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.cmd("Copilot disable")
      end,
      desc = "Disable copilot",
    })
  end,
}
