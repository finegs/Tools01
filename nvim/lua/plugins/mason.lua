return {
  -- add any tools you want to have installed below
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "gitui",
        "clangd",
        "codelldb",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "lua-language-server",
        "typescript-language-server",
        "jdtls",
        "rust-analyzer",
        -- "cssls",
      },
    },
  },
}
