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
        -- rust_analyzer = { enabled = true },
        clangd = {
          keys = {
            { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "Makefile",
              "configure.ac",
              "configure.in",
              "config.h.in",
              "meson.build",
              "meson_options.txt",
              "build.ninja"
            )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
              fname
            ) or vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
            -- require("lspconfig.util").find_git_ancestor(fname)
          end,
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
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      -- A tailored list of parsers to always keep installed and updated
      ensure_installed = {
        "c",
        "cpp",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "regex",
        "rust",
        "python",
        "typescript",
        "javascript",
        "toml",
        "yaml",
        "sql",
        "python",
      },
    },
    config = function(opts)
      -- 1. Define where you want the parsers to live
      -- (Using stdpath("data") puts it in your AppData/Local/nvim-data folder)
      -- local parser_dir = vim.fn.stdpath("data") .. "/treesitter-parsers"
      local parser_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "treesitter-parsers")

      -- 2. Use the exact logic we built earlier to guarantee the folder exists
      -- AND is added to Neovim's runtimepath so Neovim can actually read the .dll files!
      if vim.fn.isdirectory(parser_dir) == 0 then
        vim.fn.mkdir(parser_dir, "p")
      end
      vim.opt.rtp:append(parser_dir)

      require("nvim-treesitter").setup(opts)
    end,
  },
}
