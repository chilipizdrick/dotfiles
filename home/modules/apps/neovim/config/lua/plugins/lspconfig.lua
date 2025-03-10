return { -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  dependencies = {
    -- { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependents
    -- 'williamboman/mason-lspconfig.nvim',
    -- 'WhoIsSethDaniel/mason-tool-installer.nvim',
    -- { 'folke/neodev.nvim', opts = {} },
    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup(
        "kickstart-lsp-attach",
        { clear = true }
      ),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set(
            "n",
            keys,
            func,
            { buffer = event.buf, desc = "LSP: " .. desc }
          )
        end

        map(
          "gd",
          require("telescope.builtin").lsp_definitions,
          "[G]oto [D]efinition"
        )

        map(
          "gr",
          require("telescope.builtin").lsp_references,
          "[G]oto [R]eferences"
        )

        map(
          "gI",
          require("telescope.builtin").lsp_implementations,
          "[G]oto [I]mplementation"
        )

        map(
          "<leader>D",
          require("telescope.builtin").lsp_type_definitions,
          "Type [D]efinition"
        )

        map(
          "<leader>ds",
          require("telescope.builtin").lsp_document_symbols,
          "[D]ocument [S]ymbols"
        )
        map(
          "<leader>ws",
          require("telescope.builtin").lsp_dynamic_workspace_symbols,
          "[W]orkspace [S]ymbols"
        )

        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

        map("K", vim.lsp.buf.hover, "Hover Documentation")

        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup(
            "kickstart-lsp-highlight",
            { clear = false }
          )
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup(
              "kickstart-lsp-detach",
              { clear = true }
            ),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds {
                group = "kickstart-lsp-highlight",
                buffer = event2.buf,
              }
            end,
          })
        end

        if
          client
          and client.server_capabilities.inlayHintProvider
          and vim.lsp.inlay_hint
        then
          map("<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, "[T]oggle Inlay [H]ints")
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend(
      "force",
      capabilities,
      require("cmp_nvim_lsp").default_capabilities()
    )

    local servers = {
      clangd = {},
      pyright = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              check = {
                allTargets = false,
              },
            },
          },
        },
      },
      tinymist = {
        settings = {
          exportPdf = "never",
          outputPath = "$root/target/$name",
          formatterMode = "prettypst",
        },
      },
    }

    for server, config in pairs(servers) do
      config.capabilities = vim.tbl_deep_extend(
        "force",
        {},
        capabilities,
        config.capabilities or {}
      )
      require("lspconfig")[server].setup(config)
    end

    -- require('mason').setup()
    --
    -- require('mason-tool-installer').setup {
    --   ensure_installed = {
    --     'stylua',
    --   },
    -- }

    -- local ensure_installed = vim.tbl_keys(mason_servers or {})
    -- require('mason-lspconfig').setup {
    --   ensure_installed = ensure_installed,
    --   automatic_installation = false,
    --   handlers = {
    --     function(server_name)
    --       local server = mason_servers[server_name] or {}
    --       server.capabilities = vim.tbl_deep_extend(
    --         'force',
    --         {},
    --         capabilities,
    --         server.capabilities or {}
    --       )
    --       require('lspconfig')[server_name].setup(server)
    --     end,
    --   },
    -- }

    require("lspconfig").nixd.setup {
      cmd = { "nixd" },
      nixd = {
        settings = {
          nixd = {
            nixpkgs = {
              expr = "import <nixpkgs> {}",
            },
            formatting = {
              command = { "nix fmt || alejandra" },
            },
            options = {
              nixos = {
                expr = '(builtins.getFlake "/home/alex/Projects/nix/dotfiles/flake.nix").nixosConfigurations."atlas".options',
              },
              home_manager = {
                expr = '(builtins.getFlake "/home/alex/Projects/nix/dotfiles/flake.nix").homeConfigurations."atlas".options',
              },
            },
          },
        },
      },
    }

    -- require('lspconfig').qmlls.setup {
    --   cmd = { "qmlls", "-E" },
    -- }
  end,
}
