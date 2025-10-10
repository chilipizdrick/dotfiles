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
      float = {
        transparent = true,
        solid = false,
      },
      term_colors = false,

      styles = {
        comments = { "italic" },
        keywords = { "italic" },
      },

      default_integrations = true,

      lsp_styles = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
          ok = { "undercurl" },
        },
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
          ok = { "italic" },
        },
        inlay_hints = {
          background = true,
        },
      },

      integrations = {
        cmp = true,
        markdown = true,
        gitsigns = true,
        indent_blankline = {
          enabled = true,
        },
        mini = {
          enabled = true,
          indentscope_color = "",
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
