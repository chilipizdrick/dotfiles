return {
  {
    "saghen/blink.cmp",

    dependencies = {
      "rafamadriz/friendly-snippets",
      "xzbdmw/colorful-menu.nvim",
    },

    version = "1.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "super-tab" },

      appearance = {
        nerd_font_variant = "mono",
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
          -- window = { border = "rounded" },
        },
        menu = {
          -- border = "rounded",
          draw = {
            columns = { { "kind_icon" }, { "label", gap = 1 } },
            components = {
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(
                    ctx
                  )
                end,
              },
            },
          },
        },
      },

      -- signature = { window = { border = "rounded" } },

      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
        },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },
    },

    opts_extend = { "sources.default" },
  },
  {
    "xzbdmw/colorful-menu.nvim",
    config = function()
      require("colorful-menu").setup({
        ls = {
          lua_ls = {
            arguments_hl = "@comment",
          },
          ["rust-analyzer"] = {
            extra_info_hl = "@comment",
            align_type_to_right = true,
            preserve_type_when_truncate = true,
          },
          clangd = {
            extra_info_hl = "@comment",
            align_type_to_right = true,
            import_dot_hl = "@comment",
            preserve_type_when_truncate = true,
          },
          basedpyright = {
            extra_info_hl = "@comment",
          },
          fallback = true,
          fallback_extra_info_hl = "@comment",
          fallback_align_type_to_right = true,
        },
        fallback_highlight = "@variable",
        max_width = 60,
      })
    end,
  },
}
