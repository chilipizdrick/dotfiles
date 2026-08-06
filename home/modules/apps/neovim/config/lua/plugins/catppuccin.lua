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
      -- float = {
      --   -- transparent = true,
      --   -- solid = true,
      -- },
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
        telescope = {
          enabled = true,
        },
      },
    })
  end,

  init = function()
    vim.cmd.colorscheme("catppuccin-nvim")

    -- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none", fg = "#89B4FA" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })
  end,
}
