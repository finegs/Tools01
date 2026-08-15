-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
_G.myutils = require("mymodule.utils")

-- Font & UI options
vim.opt.guifont = "FiraCode Nerd Font Mono:h12"
vim.opt.termguicolors = true

if myutils.is.windows then
  vim.opt.shellslash = true
end

-- Root dir spec
vim.g.root_spec = { "lsp", { ".pjt.lua", ".init.lua", "lua" }, "cwd" }
vim.g.root_lsp_ignore = { ".gitignore" }

-- Language specific settings
vim.g.lazyvim_python_ruff = "ruff"
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_ts_lsp = "vtsls"

-- Window navigation
vim.keymap.set("n", "<Tab>", "<C-W>k", { remap = true, desc = "Next Window" })
vim.keymap.set("n", "<S-Tab>", "<C-W>k", { remap = true, desc = "Next Window" })
