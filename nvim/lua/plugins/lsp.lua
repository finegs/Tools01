return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "gitui" },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      mappings = {
        server = {},
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        rust_analyzer = {
          enabled = true,
        },
        html = {
          enabled = true,
        },
        gopls = {
          -- Setting enabled to false stops LazyVim from setting it up
          -- enabled = false,
          -- Optional: prevents Mason from trying to auto-install it
          mason = false,
        },
        fsautocomplete = {
          -- Setting enabled to false stops LazyVim from setting it up
          -- enabled = false,
          -- Optional: prevents Mason from trying to auto-install it
          mason = false,
        },
        clangd = {
          keys = {
            { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          },
          capabilities = {
            offsetEncoding = { "utf-16" },
          },
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
        },
        ruff = {
          cmd_env = { RUFF_TRACE = "messages" },
          init_options = {
            settings = {
              logLevel = "error",
            },
          },
          keys = {
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
          },
        },
        ruff_lsp = {
          keys = {
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
          },
        },
      },
      setup = {
        clangd = function(_, opts)
          local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
          require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
          return false
        end,
        -- [ruff] = function()
        --   LazyVim.lsp.on_attach(function(client, _)
        --     -- Disable hover in favor of Pyright
        --     client.server_capabilities.hoverProvider = false
        --   end, ruff)
        -- end,
      },
    },
  },
}
