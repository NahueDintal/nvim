return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      -- Tema personalizado
      theme = {
        -- Colores para los diferentes modos (normal, insert, visual, etc.)
        normal = {
          a = { bg = "#000000", fg = "#FFFFFF", gui = "bold" }, -- modo NORMAL
          b = { bg = "#000000", fg = "#FFFFFF" },
          c = { bg = "#000000", fg = "#FFFFFF" },
        },
        insert = {
          a = { bg = "#000000", fg = "#00FF00", gui = "bold" }, -- modo INSERT (verde)
          b = { bg = "#000000", fg = "#FFFFFF" },
          c = { bg = "#000000", fg = "#FFFFFF" },
        },
        visual = {
          a = { bg = "#000000", fg = "#FFA500", gui = "bold" }, -- modo VISUAL (naranja)
          b = { bg = "#000000", fg = "#FFFFFF" },
          c = { bg = "#000000", fg = "#FFFFFF" },
        },
        replace = {
          a = { bg = "#000000", fg = "#FF0000", gui = "bold" }, -- modo REPLACE (rojo)
          b = { bg = "#000000", fg = "#FFFFFF" },
          c = { bg = "#000000", fg = "#FFFFFF" },
        },
        -- Para otros modos (command, terminal, etc.) puedes agregarlos si quieres
        command = {
          a = { bg = "#000000", fg = "#FFFFFF", gui = "bold" },
          b = { bg = "#000000", fg = "#FFFFFF" },
          c = { bg = "#000000", fg = "#FFFFFF" },
        },
        terminal = {
          a = { bg = "#000000", fg = "#FFFFFF", gui = "bold" },
          b = { bg = "#000000", fg = "#FFFFFF" },
          c = { bg = "#000000", fg = "#FFFFFF" },
        },
        -- Fondo general (para la barra completa)
        -- También puedes definir 'inactive' para ventanas no activas
        inactive = {
          a = { bg = "#000000", fg = "#888888" },
          b = { bg = "#000000", fg = "#888888" },
          c = { bg = "#000000", fg = "#888888" },
        },
      },
      -- Estilo minimalista: sin separadores (totalmente plano)
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      -- Opcional: deshabilitar el borde de la barra (si usas 'nvim-cmp' u otros)
      -- disabled = false,
    },
    sections = {
      -- Definimos secciones básicas, pero solo mostramos lo esencial
      lualine_a = { "mode" }, -- Muestra el modo (NORMAL, INSERT...)
      lualine_b = { "branch" }, -- Rama de git (si quieres)
      lualine_c = { "filename" }, -- Nombre del archivo
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    -- Si quieres ocultar algunos componentes, quita los que no quieras
    -- Por ejemplo, para solo mostrar modo y archivo:
    -- lualine_a = {'mode'},
    -- lualine_c = {'filename'},
    -- y eliminas el resto.
  },
}
