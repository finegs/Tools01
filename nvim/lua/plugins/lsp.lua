return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "gitui" },
    },
  },
  {
    "mson-org/mason-lspconfig.nvim",
    opts = {
      mappings = {
        server = {},
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
  },
}
