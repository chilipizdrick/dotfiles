return {
  "nvim-neo-tree/neo-tree.nvim",

  version = "*",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  cmd = "Neotree",

  keys = {
    { "\\", "<Cmd>Neotree toggle<CR>", { desc = "Toggle NeoTree visibility" } },
  },

  opts = {
    window = {
      position = "right",
      width = 30,
    },
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".git",
        },
        never_show = {},
      },
      window = {
        mappings = {
          ["\\"] = "close_window",
        },
      },
    },
  },
}
