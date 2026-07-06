return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jdtls = {
          settings = {
            java = {
              configuration = {
                runtimes = {
                  {
                    name = "JavaSE-17",
                    path = "/usr/lib/jvm/java-17-openjdk-amd64", -- ajustá
                  },
                },
              },
              jdt = {
                ls = {
                  lombokSupport = { enabled = true },
                },
              },
            },
          },
        },
      },
    },
  },
}
