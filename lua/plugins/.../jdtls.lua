local function get_jdtls_paths()
  -- Esta es la ruta donde Mason instala jdtls
  local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
  -- Busca el archivo .jar del lanzador de Equinox
  local launcher_jar = vim.fn.glob(mason_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

  if launcher_jar == "" then
    vim.notify("jdtls: Equinox launcher not found!", vim.log.levels.ERROR)
    return nil
  end

  -- Configuración para Linux. Si usas Mac o Windows, cambia "config_linux" por "config_mac" o "config_win"[reference:9]
  local config_path = mason_path .. "/config_linux"
  -- Directorio donde jdtls guardará sus metadatos del proyecto
  local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/workspace"

  return {
    launcher_jar = launcher_jar,
    config_path = config_path,
    workspace_dir = workspace_dir,
  }
end

-- Usamos la nueva API vim.lsp.config (Neovim 0.11+)
vim.lsp.config("jdtls", {
  cmd = function()
    local paths = get_jdtls_paths()
    if not paths then
      return {}
    end

    -- El comando para iniciar jdtls. Ajusta la ruta a tu Java 21+ si es necesario.
    -- Si 'java' en tu PATH ya es la versión correcta, puedes dejarlo así.
    -- local java_cmd = "java"
    -- Si necesitas forzar una versión específica, usa la ruta completa, ej: "/usr/lib/jvm/java-21-openjdk/bin/java"
    local java_cmd = "/usr/lib/jvm/java-21-openjdk/bin/java"

    return {
      java_cmd,
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-Xms1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens", "java.base/java.util=ALL-UNNAMED",
      "--add-opens", "java.base/java.lang=ALL-UNNAMED",
      "-jar", paths.launcher_jar,
      "-configuration", paths.config_path,
      "-data", paths.workspace_dir,
    }
  end,
  root_markers = { "pom.xml", "build.gradle", ".git", "mvnw", "gradlew" }[reference:10],
  filetypes = { "java" },
})
