return {
  "mrcjkb/rustaceanvim",
  enabled = false,
  lazy = false,
  -- config = function()
  --   vim.api.nvim_create_autocmd("FileType", {
  --     pattern = { "rs" },
  --     callback = function()
  --       vim.schedule(function()
  --         vim.keymap.set("n", "<leader>a", function()
  --           vim.cmd.RustLsp "codeAction"
  --         end, { silent = "true", buffer = bufnr })
  --         vim.keymap.set("n", "K", function()
  --           vim.cmd.RustLsp { "hover", "actions" }
  --         end, { silent = "true", buffer = bufnr })
  --       end)
  --     end,
  --   })
  -- end,
}
