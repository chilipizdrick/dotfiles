vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>do", function()
  vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Floating [d]iagnostic [o]pen" })
vim.keymap.set("n", "[d", function()
  vim.diagnostic.goto_prev({ float = false })
end, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", function()
  vim.diagnostic.goto_next({ float = false })
end, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set(
  "n",
  "<leader>q",
  vim.diagnostic.setloclist,
  { desc = "Open diagnostic [Q]uickfix list" }
)
vim.keymap.set(
  "n",
  "<leader>Q",
  vim.lsp.buf.code_action,
  { desc = "Apply [Q]uickfix" }
)

vim.keymap.set(
  "n",
  "<C-h>",
  "<C-w><C-h>",
  { desc = "Move focus to the left window" }
)
vim.keymap.set(
  "n",
  "<C-l>",
  "<C-w><C-l>",
  { desc = "Move focus to the right window" }
)
vim.keymap.set(
  "n",
  "<C-j>",
  "<C-w><C-j>",
  { desc = "Move focus to the lower window" }
)
vim.keymap.set(
  "n",
  "<C-k>",
  "<C-w><C-k>",
  { desc = "Move focus to the upper window" }
)

vim.keymap.set(
  "v",
  "<leader>y",
  '"+y',
  { desc = "Yank selection to system clipboard" }
)
vim.keymap.set(
  "n",
  "<leader>yy",
  '"+yy',
  { desc = "Yank lilne to system clipboard" }
)
