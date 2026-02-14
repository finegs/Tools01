return {
  {
    "folke/snacks.nvim",
    lazy = false,
    ---@type snacks.Config
    opts = {
      explorer = {
        -- your explorer configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      picker = {
        sources = {
          explorer = {
            -- your explorer picker configuration comes here
            -- or leave it empty to use the default settings
            win = {
              list = {
                keys = {
                  ["o"] = "confirm",
                },
              },
            },
          },
          marks = {
            win = {
              list = {
                keys = {
                  ["<c-x>"] = "delmarks",
                },
              },
            },
          },
          -- Define Custom Source "var_viewer"
          var_viewer = {
            name = "Variables & Env",
            finder = function(_)
              local items = {}

              -- Helper function to add items safely
              local function add(category, key, value)
                local val_type = type(value)
                local display_value = tostring(value)

                -- Truncate long values for the list view
                if #display_value > 50 then
                  display_value = display_value:sub(1, 50) .. "..."
                end

                table.insert(items, {
                  text = string.format("%-10s %-25s %s", category, key, display_value),
                  category = category,
                  name = key,
                  type = val_type,
                  raw_value = value, -- Store raw for preview
                })
              end

              -- 1. ENV Variables (System)
              for key, value in pairs(vim.fn.environ()) do
                add("ENV", key, value)
              end

              -- 2. GLOBAL Variables (vim.g)
              for key, value in pairs(vim.g) do
                -- Filter out massive internal plugins objects
                if key ~= "loaded_netrw" and key ~= "did_install_default_menus" then
                  add("GLOBAL", key, value)
                end
              end

              -- 3. LOCAL Variables (vim.b)
              for key, value in pairs(vim.b) do
                add("LOCAL", key, value)
              end

              -- 4. VIM OPTIONS (vim.opt)
              -- We get all option names, then look up values safely
              local all_opts = vim.api.nvim_get_all_options_info()
              for key, _ in pairs(all_opts) do
                local status, val = pcall(vim.api.nvim_get_option_value, key, {})
                if status then
                  add("OPTION", key, val)
                end
              end

              return items
            end,

            -- Formatter (Colorizes the list items)
            format = function(item, _)
              local ret = {}
              -- Colorize Category
              local cat_hl = "Special"
              if item.category == "ENV" then
                cat_hl = "DiagnosticInfo"
              elseif item.category == "GLOBAL" then
                cat_hl = "Function"
              elseif item.category == "LOCAL" then
                cat_hl = "String"
              elseif item.category == "OPTION" then
                cat_hl = "Keyword"
              end

              table.insert(ret, { item.category, cat_hl })
              table.insert(ret, { " " })
              table.insert(ret, { item.name, "Identifier" })
              table.insert(ret, { " (" .. item.type .. ") ", "Comment" })

              -- Show a snippet of the value
              local val_str = tostring(item.raw_value):gsub("\n", " ")
              if #val_str > 40 then
                val_str = val_str:sub(1, 40) .. "..."
              end
              table.insert(ret, { " -> " .. val_str, "Comment" })

              return ret
            end,

            -- Previewer (Shows full value with syntax highlighting)
            preview = function(ctx)
              local item = ctx.item
              local lines = {}

              -- Header Info
              table.insert(lines, "# Variable Details")
              table.insert(lines, "")
              table.insert(lines, "* **Category:** " .. item.category)
              table.insert(lines, "* **Name:** " .. item.name)
              table.insert(lines, "* **Type:** " .. item.type)
              table.insert(lines, "")
              table.insert(lines, "## Value Preview")

              -- Formatting Logic
              if item.type == "table" then
                table.insert(lines, "```lua")
                local ok, formatted = pcall(vim.inspect, item.raw_value)
                if ok then
                  for line in formatted:gmatch("[^\r\n]+") do
                    table.insert(lines, line)
                  end
                else
                  table.insert(lines, "-- Error inspecting value")
                end
                table.insert(lines, "```")
              elseif item.category == "ENV" and (item.name:match("PATH") or item.name:match("DIRS")) then
                -- Special formatting for PATH variables
                table.insert(lines, "```bash")
                local parts = vim.split(item.raw_value, package.config:sub(1, 1) == "\\" and ";" or ":")
                for _, p in ipairs(parts) do
                  table.insert(lines, p)
                end
                table.insert(lines, "```")
              else
                -- Default formatting
                table.insert(lines, "```json")
                table.insert(lines, tostring(item.raw_value))
                table.insert(lines, "```")
              end

              -- 1. Unlock Buffer (Make modifiable)
              vim.api.nvim_set_option_value("modifiable", true, { buf = ctx.buf })

              -- 2. Write Lines
              vim.api.nvim_buf_set_lines(ctx.buf, 0, -1, false, lines)

              -- 3. Set Syntax Highlighting
              vim.api.nvim_set_option_value("filetype", "markdown", { buf = ctx.buf })
            end,
          },
        },
      },
    },
    -- Keymap
    keys = {
      {
        "<leader>sv",
        function()
          Snacks.picker.pick("var_viewer")
        end,
        desc = "Show Variables (Env/Global/Local)",
      },
    },
  },
}
