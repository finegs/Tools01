-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.root_spec = { "lsp", { ".pjt.lua", ".init.lua", "lua" }, "cwd" }

vim.g.root_lsp_ignore = { ".gitignore" }

-- REMOVE ME later  by SGK 2025-12-07
vim.g.lazyvim_check_order = false

vim.g.lazyvim_rust_diagnostics = "rust-analyzer"

vim.g.lazyvim_python_ruff = "ruff"

-- Keymap
vim.keymap.set("n", "<Leader>ww", "<Cmd>w<CR><ESC>", { remap = true, desc = "Save File" })
vim.keymap.set("n", "<Tab>", "<C-W>k", { remap = true, desc = "Next Window" })
vim.keymap.set("n", "<S-Tab>", "<C-W>k", { remap = true, desc = "Next Window" })

vim.lsp.config["lua_ls"] = {
  -- Command and arguments to start the server.
  cmd = { "lua-language-server" },
  -- Filetypes to automatically attach to.
  filetypes = { "lua" },
  -- Sets the "workspace" to the directory where any of these files is found.
  -- Files that share a root directory will reuse the LSP server connection.
  -- Nested lists indicate equal priority, see |vim.lsp.Config|.
  root_markers = { { ".pjt.lua", ".luarc.json", ".luarc.jsonc", "stylua.toml", ".stylua.toml" }, ".git" },
  -- Specific settings to send to the server. The schema is server-defined.
  -- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

vim.lsp.enable("lua_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("clangd")
vim.lsp.enable("tsserver")
vim.lsp.enable("cssls")
vim.lsp.enable("html")
vim.lsp.enable("rust-analyzer")
vim.lsp.enable("bashls")
