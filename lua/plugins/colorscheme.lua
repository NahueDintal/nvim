return {
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.aurora_italic = 1
      vim.g.aurora_transparent = 1
      vim.g.aurora_bold = 1
      vim.cmd([[colorscheme NeoSolarized]])
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
        vim.cmd([[colorscheme solarized-osaka]]),
      }
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opt = {},
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    name = "onedark",
    lazy = false,
    priority = 1000,
    opt = {},
    config = function()
      vim.cmd([[colorscheme onedark]])
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    name = "cyberdream",
    lazy = false,
    priority = 1000,
    opt = {},
    config = function()
      vim.cmd([[colorscheme cyberdream]])
    end,
  },
  {
    "shaunsingh/moonlight.nvim",
    name = "moonlight",
    lazy = false,
    priority = 1000,
    opt = {},
    config = function()
      vim.cmd([[colorscheme moonlight]])
    end,
  },
  {
    "zootedb0t/citruszest.nvim",
    lazy = false,
    priority = 1000,
    opt = {},
    config = function()
      vim.cmd([[colorscheme citruszest]])
    end,
  },
  {
    "ray-x/aurora",
    lazy = false,
    priority = 1000,
    opt = {},
    config = function()
      vim.g.aurora_italic = 1
      vim.g.aurora_transparent = 1
      vim.g.aurora_bold = 1
      vim.cmd([[colorscheme aurora]])
      vim.api.nvim_set_hl(0, "@number", { fg = "#e933e3" })
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    name = "nordic",
    lazy = false,
    priority = 1000,
    opt = {},
    config = function()
      vim.cmd([[colorscheme nordic]])
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        -- ...
      })
      vim.cmd("colorscheme github_dark")
    end,
  },
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    opt = {},
    config = function()
      vim.cmd([[colorscheme zenbones]])
    end,
  },
  {
    "nyngwang/nvimgelion",
    name = "nvimgelion",
    lazy = false,
    priority = 1000,
    opt = {},
    config = function()
      vim.cmd([[colorscheme nvimgelion]])
    end,
  },
  {
    "sekke276/dark_flat.nvim",
    name = "dark_flat",
    lazy = false,
    priority = 1000,
    opt = {},
    config = function()
      vim.cmd([[colorscheme dark_flat]])
    end,
  },
  {
    "polirritmico/monokai-nightasty.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      on_colors = function(colors)
        colors.charcoal_medium = "#455455"
      end,
    },
  },
  { "ellisonleao/gruvbox.nvim", "LazyVim/LazyVim", opts = {
    colorscheme = "gruvbox",
  } },
}
