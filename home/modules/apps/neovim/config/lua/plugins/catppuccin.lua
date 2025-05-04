return {
  "catppuccin/nvim",

  name = "catppuccin",

  priority = 1000,

  config = function()
    require("catppuccin").setup({
      flavor = "mocha",
      transparent_background = true,
      background = {
        light = "latte",
        dark = "mocha",
      },

      styles = {
        comments = { "italic" },
        keywords = { "italic" },
      },

      default_integrations = true,
      integrations = {
        cmp = true,
        markdown = true,
        gitsigns = true,
        nvimtree = false,
        treesitter = true,
        notify = true,
        noice = true,
        indent_blankline = {
          enabled = true,
        },
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        neotree = true,
        neogit = true,
        dap = true,
        dap_ui = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
          },
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "underline" },
            ok = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        snacks = {
          enabled = true,
        },
        telescope = {
          enabled = true,
        },
      },
    })
  end,

  init = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
