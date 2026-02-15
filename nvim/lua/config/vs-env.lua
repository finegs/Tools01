return {
  -- This is a local plugin configuration, so we don't need a repository URL
  dir = vim.fn.stdpath("config") .. "/lua/plugins/vs-env.lua",
  lazy = false, -- Load immediately or on specific events
  config = function()
    -- 1. Define the function to append paths
    local function append_vs_includes()
      -- Check if we are on Windows
      local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
      if not is_windows then
        return
      end

      -- Get the environment variables
      local include_env = vim.fn.getenv("INCLUDE")
      local ext_include_env = vim.fn.getenv("EXTERNAL_INCLUDE")

      -- Combine them (handle nil cases)
      local full_env = ""
      if include_env ~= vim.NIL and include_env ~= "" then
        full_env = full_env .. include_env
      end
      if ext_include_env ~= vim.NIL and ext_include_env ~= "" then
        full_env = full_env .. ";" .. ext_include_env
      end

      -- If no vars found, exit (User likely didn't run vcvarsall.bat)
      if full_env == "" then
        return
      end

      -- 2. Split by semicolon (;) and append to vim.opt.path
      -- We use vim.split for safe splitting
      local paths = vim.split(full_env, ";")

      for _, path in ipairs(paths) do
        if path and path ~= "" then
          -- Clean up path separators to forward slashes for Neovim
          local clean_path = path:gsub("\\", "/")

          -- Remove trailing slashes which sometimes break things
          if clean_path:sub(-1) == "/" then
            clean_path = clean_path:sub(1, -2)
          end

          -- Append to the current buffer's path option
          -- ,, = keep default path
          -- += append
          vim.opt_local.path:append(clean_path)
        end
      end

      -- Optional: Notify user (useful for debugging, comment out later)
      -- vim.notify("VS Includes appended to path", vim.log.levels.INFO)
    end

    -- 3. Create the Autocommand
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "cpp", "h", "hpp" },
      callback = append_vs_includes,
      group = vim.api.nvim_create_augroup("VS_Env_Include", { clear = true }),
    })
  end,
}
