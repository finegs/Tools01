-- Register LSP handlers to silence unhandled server requests
vim.lsp.handlers["workspace/diagnostic/refresh"] = function(_, _, context)
  return vim.NIL, nil
end

-- Register fallback configs for plugins using vim.lsp.start
if vim.lsp.config then
  vim.lsp.config["crates.nvim"] = vim.lsp.config["crates.nvim"] or { cmd = { "true" } }
  vim.lsp.config["rust-analyzer"] = vim.lsp.config["rust-analyzer"] or { cmd = { "rust-analyzer" } }
end

return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "gitui", "codelldb" },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "vimls",
        "lua_ls",
        "vtsls",
        "rust_analyzer",
        "pyright",
        "gopls",
        "marksman",
        "taplo",
      },
    },
    dependencies = {
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        -- rust_analyzer = { enabled = true },
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- Specify * to use this function as a fallback for any server
        ["*"] = function(server, opts) end,
        vimls = {},
        lua_ls = {},
        vtsls = {},
        rust_analyzer = { enabled = false }, -- Managed by rustaceanvim
        pyright = {},
        gopls = {},
        marksman = {},
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

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "cpp",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "ron",
        "rust",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- Or your specific build command
    -- config = function()
    --   require('nvim-treesitter.configs').setup({
    --     -- Your treesitter config here (ensure_installed, highlight, etc.)
    --   })
    -- end
    -- or use `opts = {}` and let lazy.nvim handle `setup` if available
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "vim",
        "vimdoc",
        "lua",
        "luadoc",
        "typescript",
        "javascript",
        "tsx",
        "rust",
        "ron",
        "python",
        "go",
        "gomod",
        "gowork",
        "gotmpl",
        "markdown",
        "markdown_inline",
      })
    end,
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },
}
