-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(args)
    -- 1. Get the client and buffer info
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    -- 2. Check specifically for the TypeScript server
    -- Note: 'tsserver' was recently renamed to 'ts_ls' in nvim-lspconfig.
    -- If you use 'vtsls', change the name below to 'vtsls'.
    if client.name == "ts_ls" or client.name == "tsserver" then
      -- A. DISABLE FORMATTING (Common if you use Prettier)
      -- This prevents ts_ls from fighting with Prettier/null-ls
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      -- B. ADD TYPESCRIPT-SPECIFIC KEYMAPS
      local opts = { buffer = args.buf, silent = true }

      -- Example: Organize Imports
      vim.keymap.set("n", "<leader>co", function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.organizeImports" },
            diagnostics = {},
          },
        })
      end, { desc = "Organize Imports", buffer = args.buf })

      -- Example: Remove Unused Imports
      vim.keymap.set("n", "<leader>cR", function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.removeUnused" },
            diagnostics = {},
          },
        })
      end, { desc = "Remove Unused Imports", buffer = args.buf })

      -- Example: Rename File (Move) - keeps imports updated
      vim.keymap.set("n", "<leader>cM", function()
        vim.lsp.buf.execute_command({
          command = "_typescript.applyRenameFile",
          arguments = {
            {
              sourceUri = vim.uri_from_bufnr(0),
              targetUri = vim.uri_from_fname(vim.fn.input("New path: ", vim.fn.expand("%"))),
            },
          },
        })
      end, { desc = "Rename File (TS)", buffer = args.buf })
    end
  end,
})
