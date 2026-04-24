vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",

  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),

  callback = function()
    vim.highlight.on_yank()
  end,
})

local progress = vim.defaulttable()

local spinner_frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
local spinner_index = 1
local current_msg = nil
local last_msg = "Done"
local spin_timer = nil
local clear_timer = nil

-- Safely stop the spinning timer
local function stop_spin_timer()
  if spin_timer then
    spin_timer:stop()
    if not spin_timer:is_closing() then
      spin_timer:close()
    end
    spin_timer = nil
  end
end

-- Safely stop the clearing timer
local function stop_clear_timer()
  if clear_timer then
    clear_timer:stop()
    if not clear_timer:is_closing() then
      clear_timer:close()
    end
    clear_timer = nil
  end
end

-- Helper to format, truncate, and echo the message to the command line
local function echo_msg(icon, text)
  local full_str = icon .. " " .. text
  local max_len = vim.v.echospace

  -- Truncate if it exceeds available space to prevent "Hit ENTER" prompts
  if vim.api.nvim_strwidth(full_str) > max_len then
    local truncate_len = math.max(0, max_len - 3)
    full_str = vim.fn.strcharpart(full_str, 0, truncate_len) .. "..."
  end

  vim.api.nvim_echo({ { full_str, "WarningMsg" } }, false, {})
end

-- Start the independent spinner loop
local function start_spin_timer()
  stop_clear_timer()
  if spin_timer then
    return
  end

  spin_timer = vim.uv.new_timer()
  spin_timer:start(
    0,
    100,
    vim.schedule_wrap(function()
      if not current_msg then
        stop_spin_timer()
        return
      end

      spinner_index = (spinner_index % #spinner_frames) + 1
      echo_msg(spinner_frames[spinner_index], current_msg)
    end)
  )
end

-- Trigger the 3-second completion sequence
local function trigger_clear()
  stop_spin_timer()

  -- Show the checkmark and the final 100% state
  echo_msg("✓", last_msg)

  stop_clear_timer()
  clear_timer = vim.uv.new_timer()
  clear_timer:start(
    3000,
    0,
    vim.schedule_wrap(function()
      vim.api.nvim_echo({}, false, {})
      vim.cmd("redraw")
      spinner_index = 1
      stop_clear_timer()
    end)
  )
end

vim.api.nvim_create_autocmd("LspProgress", {
  group = vim.api.nvim_create_augroup("LspProgressEcho", { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]

    if not client or type(value) ~= "table" then
      return
    end

    local p = progress[client.id]

    -- Track or update the specific token
    for i = 1, #p + 1 do
      if i == #p + 1 or p[i].token == ev.data.params.token then
        p[i] = {
          token = ev.data.params.token,
          msg = ("[%3d%%] %s%s"):format(
            value.kind == "end" and 100 or value.percentage or 100,
            value.title or "",
            value.message and (" **%s**"):format(value.message) or ""
          ),
          done = value.kind == "end",
        }
        break
      end
    end

    local all_messages = {}
    local is_active = false

    -- Gather all current messages across all clients (including ones that just hit 100%)
    for cid, client_progress in pairs(progress) do
      local c = vim.lsp.get_client_by_id(cid)
      local c_name = c and c.name or "LSP"

      for _, v in ipairs(client_progress) do
        table.insert(all_messages, c_name .. ": " .. v.msg)
        if not v.done then
          is_active = true
        end
      end
    end

    -- Clean up completed tokens from the state table for this client immediately
    progress[client.id] = vim.tbl_filter(function(v)
      return not v.done
    end, p)

    -- Join multiple active tasks into a single line
    local combined_msg = table.concat(all_messages, " | ")

    if not is_active then
      -- If all tasks are done, cache the final 100% output and start the countdown
      if current_msg then
        last_msg = combined_msg ~= "" and combined_msg or last_msg
        current_msg = nil
        trigger_clear()
      end
    else
      -- If tasks are active, update the strings and ensure the spinner is running
      current_msg = combined_msg
      last_msg = combined_msg
      start_spin_timer()
    end
  end,
})
