return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java", -- solo se carga en archivos Java
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      -- Esta función se ejecuta al abrir un archivo Java
      local jdtls = require("jdtls")

      -- Busca automáticamente la instalación de jdtls de Mason
      local mason_registry = require("mason-registry")
      local jdtls_path = mason_registry.get_package("jdtls"):get_install_path()

      -- Ruta a los scripts de inicio (varía por SO)
      local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
      local config_path = jdtls_path .. "/config_linux" -- usa config_mac o config_win según tu SO
      if vim.fn.has("mac") == 1 then
        config_path = jdtls_path .. "/config_mac"
      elseif vim.fn.has("win32") == 1 then
        config_path = jdtls_path .. "/config_win"
      end

      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name
      vim.fn.mkdir(workspace_dir, "p")

      -- Configuración de jdtls
      local cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-jar",
        launcher,
        "-configuration",
        config_path,
        "-data",
        workspace_dir,
      }

      jdtls.start_or_attach({
        cmd = cmd,
        settings = {
          java = {
            -- Ajusta según tu proyecto (Maven, Gradle, etc.)
            import = { gradle = { enabled = true }, maven = { enabled = true } },
            completion = { favoriteStaticMembers = { "org.junit.Assert.*" } },
          },
        },
        -- Opcional: atajos de teclado
        on_attach = function(client, bufnr)
          -- Puedes añadir atajos aquí si quieres
        end,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jdtls = { enabled = false },
      },
    },
  },
}
