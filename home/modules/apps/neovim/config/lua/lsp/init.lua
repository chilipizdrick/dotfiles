vim.lsp.config("*", {
  root_markers = { ".git" },
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      },
    },
  },
})

vim.lsp.config.tinymist = {
  settings = {
    exportPdf = "never",
    outputPath = "$root/target/$name",
    formatterMode = "typstyle",
  },
}

vim.lsp.config.nixd = {
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> {}",
      },
      formatting = {
        command = { "nix fmt || alejandra" },
      },
    },
  },
}

local servers = {
  "pyright",
  "nixd",
  "lua_ls",
  "clangd",
  "tinymist",
  "ts_ls",
  "wgsl_analyzer",
}

for _, lsp in pairs(servers) do
  vim.lsp.enable(lsp)
end
