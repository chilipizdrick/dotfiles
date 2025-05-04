return {
  "zbirenbaum/copilot.lua",

  event = "VimEnter",

  cmd = "Copilot",

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
