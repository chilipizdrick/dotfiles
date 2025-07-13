return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      -- "giuxtaposition/blink-cmp-copilot",
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
        -- ghost_text = {
        --   enabled = function()
        --     local selected_item = require("blink-cmp").get_selected_item()
        --     if selected_item and selected_item.client_name == "copilot" then
        --       return true
        --     end
        --     return false
        --   end,
        -- },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
          window = { border = "rounded" },
        },
        menu = {
          border = "rounded",
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

      signature = { window = { border = "rounded" } },

      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
          -- "copilot",
        },
        -- providers = {
        --   copilot = {
        --     name = "copilot",
        --     module = "blink-cmp-copilot",
        --     score_offset = 100,
        --     async = true,
        --     transform_items = function(_, items)
        --       local CompletionItemKind =
        --         require("blink.cmp.types").CompletionItemKind
        --       local kind_idx = #CompletionItemKind + 1
        --       CompletionItemKind[kind_idx] = "Copilot"
        --       for _, item in ipairs(items) do
        --         item.client_name = "copilot"
        --         item.kind = kind_idx
        --       end
        --       return items
        --     end,
        --   },
        -- },
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
  {
    "giuxtaposition/blink-cmp-copilot",
  },
}
