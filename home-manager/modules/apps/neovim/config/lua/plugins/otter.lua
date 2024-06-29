return {
  'jmbuhr/otter.nvim',
  lazy = false,
  dependencies = {
    'hrsh7th/nvim-cmp',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local languages = {
      'nix',
      'python',
      'lua',
      'javascript',
      'css',
      'html',
      'csv',
      'bash',
      'toml',
    }
    local completion = true
    local diagnostics = true
    local tsquery = nil
    require('otter').setup()
    require('otter').activate(languages, completion, diagnostics, tsquery)
  end,
}
