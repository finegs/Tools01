return {
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
        "cmake",
        "make",
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
