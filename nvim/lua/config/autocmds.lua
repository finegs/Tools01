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

-- added on 2026-02-14
-- lua/config/autocmds.lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "objc", "objcpp" },
  callback = function()
    -- ... (Clang detection code) ...
    -- 1. DETECT CLANG PROJECT
    -- Look for compile_commands.json or .clangd starting from the current file's dir
    local root_markers = { "compile_commands.json", ".clangd" }
    local matches = vim.fs.find(root_markers, {
      upward = true,
      stop = vim.env.HOME, -- Stop searching at home dir to be safe
      path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
    })

    -- If NO clang project is found, STOP here.
    if #matches == 0 then
      return
    end

    -- 2. Get Environment Variable
    local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
    local env_separator = is_windows and ";" or ":"
    local env_val = vim.env.EXTERNAL_INCLUDE or vim.env.INCLUDE

    if not env_val or env_val == "" then
      return
    end

    -- 3. Prepare Existing Paths (to prevent duplicates)
    -- We create a "Set" of current paths for fast lookup
    local current_paths = vim.opt_local.path:get()
    local path_set = {}
    for _, p in ipairs(current_paths) do
      path_set[p] = true
    end

    local paths = vim.split(env_val, env_separator, { trimempty = true })

    for _, raw_path in ipairs(paths) do
      -- 1. Standard Sanitize (\ -> /)
      local clean_path = raw_path:gsub("[\\/]+", "/"):gsub("/$", "")

      if vim.fn.isdirectory(clean_path) == 1 then
        -- 2. CRITICAL FIX: Escape spaces (" " -> "\ ")
        -- This ensures Vim treats "Program Files" as one folder, not two.
        local escaped_path = clean_path:gsub(" ", "\\ ")

        -- 3. Add Recursive path
        local recursive = escaped_path .. "/**"

        -- Append
        if not path_set[recursive] then
          vim.opt_local.path:append(recursive)
          path_set[recursive] = true
        end

        if not path_set[escaped_path] then
          vim.opt_local.path:append(escaped_path)
          path_set[escaped_path] = true
        end
      end
    end
  end,
})
