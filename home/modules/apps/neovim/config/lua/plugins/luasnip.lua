return {
  "L3MON4D3/LuaSnip",

  build = "make install_jsregexp",

  event = "InsertEnter",

  config = function()
    local ls = require("luasnip")

    ls.config.set_config({
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
    })
  end,
}
