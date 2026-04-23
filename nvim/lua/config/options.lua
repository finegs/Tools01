-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
_G.myutils = require("mymodule.utils")

-- added by SGk 2026-04-23
-- ```shell > scoop bucket add nerd-fonts && soope install FiraCode-NF FiraCode-NF-Mono FiraCode`
vim.opt.guifont = "FiraCode Nerd Font Mono:h12"
-- vim.opt.guifont = "Fira_Code:h12"

-- -- by SGK 2026-04-02
-- utils.ensure_rtp(vim.fn.stdpath("data") .. "/site")

-- added by SGK 2026-04-23
if myutils.is.windows then
  vim.opt.shellslash = true
end

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

-- Plantuml
if myutils.is.windows then
  vim.g["plantuml_previewer#plantuml_jar_path"] = "C:/Programs/share/plantuml/plantuml-gplv2-1.2025.10.jar"
  vim.g["plantuml_previewer#viewer_path"] = [[C:\Dev\temp\puml_viewer]]
  vim.g["plantuml_previewer#debug_mode"] = 1
end

vim.lsp.config("*", {
  root_markers = { ".pjt.lua", "compile_commands.json", "package.json", ".luarc.json" },
})

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
        path = { "lua/?.lua", "lua/?/init.lua" },
      },
      diagnostics = {
        globals = { "vim", "Snacks" },
      },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
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
