return {
  "L3MON4D3/LuaSnip",

  event = "InsertEnter",

  build = "make install_jsregexp",

  config = function()
    local ls = require("luasnip")

    ls.config.set_config({
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
    })
  end,
}
