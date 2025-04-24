return {
  "windwp/nvim-autopairs",

  event = "InsertEnter",

  config = function()
    local npairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")
    npairs.setup({})
    npairs.add_rule(Rule("$", "$", { "tex", "latex", "typst", "markdown" }))
  end,
}
