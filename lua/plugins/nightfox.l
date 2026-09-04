return {
  "EdenEast/nightfox.nvim",
  config = function()
    require("nightfox").setup({
      options = {
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
      },
    })
    -- Cambia esta línea por la variante que quieras:
    -- "nightfox", "carbonfox", "dayfox", "dawnfox", "duskfox", "nordfox", "terafox"
    vim.cmd.colorscheme("carbonfox")
  end,
}
