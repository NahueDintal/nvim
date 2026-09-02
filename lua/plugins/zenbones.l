return {
  "zenbones-theme/zenbones.nvim",
  dependencies = "rktjmp/lush.nvim",
  lazy = false,
  priority = 1000,
  opt = {},
  config = function()
    vim.cmd([[colorscheme zenbones]])
  end,
}
