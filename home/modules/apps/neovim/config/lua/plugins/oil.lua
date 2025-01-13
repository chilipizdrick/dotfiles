return { -- File explorer
  'stevearc/oil.nvim',
  -- lazy = true,
  -- cmd = 'Oil',
  opts = {
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ['\\'] = false,
      ['<Bslash>'] = false,
      ['<C-h>'] = false,
      ['<C-l>'] = false,
    },
    -- use_defalut_keymaps = false,
  },
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
