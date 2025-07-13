vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.termguicolors = true

vim.g.rustaceanvim = {
  server = {
    default_settings = {
      ["rust-analyzer"] = {
        check = {
          command = "clippy",
        },
      },
    },
  },
}

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Spelling
vim.opt.spelllang = "en_us,ru_ru"
vim.opt.spell = true

-- Russian langmap
local function escape(str)
  local escape_chars = [[;,."|\]]
  return vim.fn.escape(str, escape_chars)
end

local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift =
  [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

vim.opt.langmap = vim.fn.join({
  escape(ru_shift) .. ";" .. escape(en_shift),
  escape(ru) .. ";" .. escape(en),
}, ",")

-- Neovide config
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMonoNL Nerd Font:h12"
  vim.g.neovide_background_color = "#00000000"
  vim.g.neovide_transparency = 0.7
end
