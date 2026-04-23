-- In a file like ~/.config/nvim/lua/myfunctions.lua
local M = {} -- M is a table to hold public functions for the module

local os_name = vim.loop.os_uname().sysname

M.is = {
  windows = (string.find(os_name:lower(), "window", 1, true)),
  linux = (string.find(os_name:lower(), "linux", 1, true)),
  mac = (string.find(os_name:lower(), "darwin", 1, true)),
  unknown = function(self)
    return not self.windowns and not self.linux and not self.mac
  end,
}

M.get_name = function()
  return os_name
end

function M.ensure_rtp(path)
  -- 1. Normalize the input path (handles Windows/Linux slash differences
  -- and strips trailing slashes so comparisons don't fail)
  local target = vim.fs.normalize(path)

  -- 2. Loop through the current runtimepath table
  ---@diagnostic disable-next-line: param-type-mismatch
  for _, rtp_path in ipairs(vim.opt.rtp:get()) do
    if vim.fs.normalize(rtp_path) == target then
      return true
    end
  end

  return false
end

function M.jump_and_create_file()
  local line = vim.api.nvim_get_current_line()
  local cursor_col = vim.api.nvim_win_get_cursor(0)[2]
  local pos = cursor_col + 1 -- Neovim cursor is 0-indexed, Lua strings are 1-indexed

  -- Define the asymmetric and symmetric pairs
  local pairs = {
    ["'"] = "'",
    ['"'] = '"',
    ["["] = "]",
    ["{"] = "}",
    ["("] = ")",
  }

  local left_idx = nil
  local closer = nil

  -- 1. SEARCH BACKWARD (Left) from cursor to find the nearest opening wrapper
  for i = pos, 1, -1 do
    local char = line:sub(i, i)
    if pairs[char] then
      left_idx = i
      closer = pairs[char] -- Store the expected matching character
      break
    end
  end

  local extracted_path = nil

  -- 2. SEARCH FORWARD (Right) from cursor to find the matching closer
  if left_idx and closer then
    -- Start searching forward from either the cursor position OR right after the opener
    local start_right = math.max(pos, left_idx + 1)

    for i = start_right, #line do
      if line:sub(i, i) == closer then
        -- Match found! Extract everything strictly between the two indices
        extracted_path = line:sub(left_idx + 1, i - 1)
        break
      end
    end
  end

  -- 3. Fallback: If no valid wrappers surround the cursor, use default 'gf'
  if not extracted_path or extracted_path == "" then
    vim.cmd("normal! gf")
    return
  end

  -- 4. Path Resolution (Handling Windows/Linux and dots)
  local is_absolute = extracted_path:match("^/") or extracted_path:match("^%a:") or extracted_path:match("^~")
  local raw_path = extracted_path

  if not is_absolute then
    raw_path = vim.fn.expand("%:p:h") .. "/" .. extracted_path
  end

  local final_full_path = vim.fn.fnamemodify(raw_path, ":p")

  -- 5. Execution Logic
  if vim.fn.filereadable(final_full_path) == 1 then
    vim.cmd("edit " .. vim.fn.fnameescape(final_full_path))
  else
    local prompt_msg = "File does not exist:\n" .. final_full_path .. "\n\nCreate it?"
    local choice = vim.fn.confirm(prompt_msg, "&Yes\n&No", 2)

    if choice == 1 then
      local parent_dir = vim.fn.fnamemodify(final_full_path, ":h")
      if vim.fn.isdirectory(parent_dir) == 0 then
        vim.fn.mkdir(parent_dir, "p")
      end
      vim.cmd("edit " .. vim.fn.fnameescape(final_full_path))
      vim.cmd("write")
      vim.notify("Created: " .. final_full_path, vim.log.levels.INFO)
    else
      vim.notify("Aborted", vim.log.levels.WARN)
    end
  end
end

function M.populate_env_path_to_local_path()
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
end

return M -- Return the public interface
