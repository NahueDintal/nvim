return {
  "olimorris/onedarkpro.nvim",
  name = "onedark",
  lazy = false,
  priority = 1000,
  opt = {},
  config = function()
    vim.cmd([[colorscheme onedark]])
  end,
}
