-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.root_spec = { "lsp", { ".pjt.lua", ".init.lua", "lua" }, "cwd" }

vim.g.root_lsp_ignore = { ".gitignore" }

-- vim.g.lazyvim_rust_diagnostics = "rust-analyzer"

vim.g.lazyvim_python_ruff = "ruff"

-- Keymap
vim.keymap.set("n", "<Leader>ww", "<Cmd>w<CR><ESC>", { remap = true, desc = "Save File" })
vim.keymap.set("n", "<Tab>", "<C-W>k", { remap = true, desc = "Next Window" })
vim.keymap.set("n", "<S-Tab>", "<C-W>k", { remap = true, desc = "Next Window" })
