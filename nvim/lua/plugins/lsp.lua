return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "gitui",
        "codelldb",
        "debugpy",
        "js-debug-adapter",
        "html-lsp",
        "css-lsp",
        "json-lsp",
        "yaml-language-server",
        "taplo",
        "prettier",
      })
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "vimls",
        "lua_ls",
        "vtsls",
        "rust_analyzer",
        "pyright",
        "html",
        "cssls",
        "jsonls",
        "yamlls",
        "taplo",
        "gopls",
        "marksman",
      })
    end,
    dependencies = {
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/SchemaStore.nvim",
    },
    opts = {
      servers = {
        vimls = {},
        lua_ls = {},
        vtsls = {},
        rust_analyzer = { enabled = false }, -- Managed by rustaceanvim
        pyright = {},
        html = {},
        cssls = {},
        gopls = {},
        marksman = {},
        -- JSON language server with SchemaStore catalog
        jsonls = {
          before_init = function(_, new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
          end,
          settings = {
            json = {
              format = { enable = true },
              validate = { enable = true },
            },
          },
        },
        -- YAML language server with SchemaStore catalog
        yamlls = {
          capabilities = {
            textDocument = {
              foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
              },
            },
          },
          before_init = function(_, new_config)
            new_config.settings.yaml.schemas = vim.tbl_deep_extend(
              "force",
              new_config.settings.yaml.schemas or {},
              require("schemastore").yaml.schemas()
            )
          end,
          settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
              keyOrdering = false,
              format = { enable = true },
              validate = true,
              schemaStore = {
                enable = false,
                url = "",
              },
            },
          },
        },
        -- TOML language server
        taplo = {
          settings = {
            evenBetterToml = {
              schema = {
                enabled = true,
                catalogs = {},
              },
            },
          },
        },
      },
    },
  },
}
