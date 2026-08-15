return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        -- C / C++
        "c",
        "cpp",
        -- Rust
        "rust",
        "ron",
        -- Web (TS/JS/HTML/CSS)
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        -- Config / Data formats
        "toml",
        "yaml",
        "json",
        "json5",
        "jsonc",
        -- Python
        "python",
        "ninja",
        "rst",
        -- Lua & Vim
        "lua",
        "luadoc",
        "luap",
        "vim",
        "vimdoc",
        -- Shell & Utilities
        "bash",
        "regex",
        "markdown",
        "markdown_inline",
        -- Build / Tools
        "cmake",
        "make",
        "sql",
        "go",
        "gomod",
        "gowork",
        "gotmpl",
      })
    end,
  },
}
