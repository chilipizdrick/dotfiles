return {
  "zbirenbaum/copilot.lua",

  enabled = true,

  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
  },

  cmd = "Copilot",

  event = "InsertEnter",

  init = function()
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.cmd "Copilot disable"
      end,
    })
  end,
}
