return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      -- Asegura que use Java 21 para el servidor si es necesario
      -- (asumiendo que tienes Java 21 instalado en /usr/lib/jvm/java-21-openjdk)
      local java_21_home = "/usr/lib/jvm/java-26-openjdk" -- ajusta esta ruta
      if vim.fn.isdirectory(java_26_home) == 1 then
        opts.cmd = {
          "env",
          "JAVA_HOME=" .. java_26_home,
          "jdtls",
          -- Añade aquí los argumentos originales si los necesitas, pero normalmente
          -- LazyVim los agrega automáticamente después de este cmd.
        }
      end
      return opts
    end,
  },
}
