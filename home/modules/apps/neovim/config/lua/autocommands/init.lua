vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local function echo_msg(text)
  local max_len = vim.v.echospace
  if vim.api.nvim_strwidth(text) > max_len then
    local truncate_len = math.max(0, max_len - 3)
    text = vim.fn.strcharpart(text, 0, truncate_len) .. "..."
  end
  vim.api.nvim_echo({ { text, "WarningMsg" } }, false, {})
end

vim.api.nvim_create_autocmd("LspProgress", {
  desc = "Echo out LSP client progress",
  group = vim.api.nvim_create_augroup("LspProgressEcho", { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local lsp_progress = ev.data.params.value

    if lsp_progress.kind == "end" then
      vim.api.nvim_echo({}, false, {})
    else
      local msg = (client.name or "LSP")
        .. ": "
        .. (lsp_progress.title or "")
        .. " "
        .. ((lsp_progress.percentage and lsp_progress.percentage .. "%") or "")
      echo_msg(msg)
    end
  end,
})
