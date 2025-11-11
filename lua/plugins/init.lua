-- ~/.config/nvim/lua/plugins/init.lua
return {
  -- Plugin 1
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "hyprlang",
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "c_sharp",
        "razor",
      },
    },
  },

  -- Plugin 2
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     registries = {
  --       "github:mason-org/mason-registry",
  --       "github:Crashdummyy/mason-registry",
  --     },
  --     ensure_installed = {
  --       "lua-language-server",
  --       "xmlformatter",
  --       "csharpier",
  --       "prettier",
  --       "stylua",
  --       "bicep-lsp",
  --       "html-lsp",
  --       "css-lsp",
  --       "eslint-lsp",
  --       "typescript-language-server",
  --       "json-lsp",
  --       "rust-analyzer",
  --       "roslyn",
  --       "rzls",
  --     },
  --   },
  -- },

  -- Plugin 3 - roslyn.nvim CON LA CONFIGURACIÓN COMPLETA
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor" },
    opts = {},
    dependencies = {
      {
        "tris203/rzls.nvim",
        config = true,
      },
    },
    lazy = false,
    config = function()
      local mason_registry = require("mason-registry")
      local rzls_path = vim.fn.expand("$MASON/packages/rzls/libexec")
      local cmd = {
        "roslyn",
        "--stdio",
        "--logLevel=Information",
        "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
        "--razorSourceGenerator=" .. vim.fs.joinpath(rzls_path, "Microsoft.CodeAnalysis.Razor.Compiler.dll"),
        "--razorDesignTimePath=" .. vim.fs.joinpath(rzls_path, "Targets", "Microsoft.NET.Sdk.Razor.DesignTime.targets"),
        "--extension",
        vim.fs.joinpath(rzls_path, "RazorExtension", "Microsoft.VisualStudioCode.RazorExtension.dll"),
      }

      vim.lsp.config("roslyn", {
        cmd = cmd,
        handlers = require("rzls.roslyn_handlers"),
        settings = {
          ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            csharp_enable_inlay_hints_for_types = true,
            dotnet_enable_inlay_hints_for_indexer_parameters = true,
            dotnet_enable_inlay_hints_for_literal_parameters = true,
            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
            dotnet_enable_inlay_hints_for_other_parameters = true,
            dotnet_enable_inlay_hints_for_parameters = true,
            dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
          },
          ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
          },
        },
      })
      vim.lsp.enable("roslyn")
    end,
    init = function()
      vim.filetype.add({
        extension = {
          razor = "razor",
          cshtml = "razor",
        },
      })
    end,
  },

  -- Plugin 4 - Debugging
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require("config.nvim-dap")
    end,
    event = "VeryLazy",
  },

  -- Plugin 5 - DAP UI
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("config.nvim-dap-ui")
    end,
  },

  -- Plugin 6 - neotest
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "Issafalcon/neotest-dotnet",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-dotnet"),
        },
      })
    end,
  },

  -- Plugin 7 - neotest-dotnet
  {
    "Issafalcon/neotest-dotnet",
    lazy = false,
  },
}
