return {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "nvim-tree/nvim-web-devicons",
      enabled = vim.g.have_nerd_font,
    },
  },

  event = "VimEnter",

  branch = "master",

  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    local builtin = require("telescope.builtin")

    vim.keymap.set(
      "n",
      "<leader>sf",
      builtin.find_files,
      { desc = "[S]earch [F]iles" }
    )

    vim.keymap.set(
      "n",
      "<leader>sw",
      builtin.grep_string,
      { desc = "[S]earch current [W]ord" }
    )

    vim.keymap.set(
      "n",
      "<leader>sg",
      builtin.live_grep,
      { desc = "[S]earch by [G]rep" }
    )

    vim.keymap.set(
      "n",
      "<leader>sd",
      builtin.diagnostics,
      { desc = "[S]earch [D]iagnostics" }
    )

    vim.keymap.set(
      "n",
      "<leader>sr",
      builtin.resume,
      { desc = "[S]earch [R]esume" }
    )

    vim.keymap.set(
      "n",
      "<leader>s.",
      builtin.oldfiles,
      { desc = '[S]earch Recent Files ("." for repeat)' }
    )

    vim.keymap.set(
      "n",
      "<leader><leader>",
      builtin.buffers,
      { desc = "[ ] Find existing buffers" }
    )

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(
            mode,
            keys,
            func,
            { buffer = event.buf, desc = "LSP: " .. desc }
          )
        end

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
          "gd",
          require("telescope.builtin").lsp_definitions,
          "[G]oto [D]efinition"
        )

        map(
          "gT",
          require("telescope.builtin").lsp_type_definitions,
          "[G]oto [T]ype Definition"
        )

        local highlight_augroup =
          vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          buffer = event.buf,
          group = highlight_augroup,
          callback = function()
            if
              vim.lsp.get_clients()[1].server_capabilities.documentHighlightProvider
            then
              vim.lsp.buf.document_highlight()
            end
          end,
        })

        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          buffer = event.buf,
          group = highlight_augroup,
          callback = function()
            if
              vim.lsp.get_clients()[1].server_capabilities.documentHighlightProvider
            then
              vim.lsp.buf.clear_references()
            end
          end,
        })

        vim.api.nvim_create_autocmd("LspDetach", {
          group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
          callback = function(event2)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds({
              group = "lsp-highlight",
              buffer = event2.buf,
            })
          end,
        })

        map("<leader>th", function()
          vim.lsp.inlay_hint.enable(
            not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
          )
        end, "[T]oggle Inlay [H]ints")
      end,
    })

    -- set telescope highlights to none
    local hl_groups = {
      -- "TelescopeMatching",
      -- "TelescopeSelection",
      "TelescopePromptTitle",
      -- "TelescopePromptPrefix",
      -- "TelescopePromptCounter",
      "TelescopePromptNormal",
      "TelescopePromptBorder",
      "TelescopeResultsTitle",
      "TelescopeResultsNormal",
      "TelescopeResultsBorder",
      "TelescopePreviewTitle",
      "TelescopePreviewNormal",
      "TelescopePreviewBorder",
    }
    for _, group in ipairs(hl_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none" })
    end
  end,
}
