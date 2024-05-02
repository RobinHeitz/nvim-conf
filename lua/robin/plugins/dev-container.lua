return {
  "https://codeberg.org/esensar/nvim-dev-container",
  dependencies = "nvim-treesitter/nvim-treesitter",

  config = function()
    local dev = require("devcontainer")
    dev.setup({})
  end,
}
