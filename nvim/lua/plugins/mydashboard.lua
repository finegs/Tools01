if true then
  return {}
end

-- lua/plugins/dashboard.lua

return {
  "echasnovski/mini.starter",
  version = "*",
  event = "VimEnter", -- Load immediately on startup
  opts = function()
    local starter = require("mini.starter")
    return {
      -- 1. Header
      header = table.concat({
        "   NEOVIM   ",
        "  Dev Mode  ",
      }, "\n"),

      -- 2. Items (Menu entries)
      items = {
        starter.sections.builtin_actions(),
        starter.sections.recent_files(5, false, false),
        starter.sections.recent_files(5, true, false), -- Current directory recent files
        { name = "Lazy", action = "Lazy", section = "Plugins" },
        { name = "Mason", action = "Mason", section = "Plugins" },
        { name = "Quit", action = "qa", section = "Builtin" },
      },

      -- 3. Layout Hooks (Centering, etc.)
      content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.aligning("center", "center"),
      },

      -- 4. Footer
      footer = "Start coding...",
    }
  end,
  -- Explicit config function to call setup()
  config = function(_, opts)
    -- Close Lazy and other windows if they are open (clean start)
    vim.cmd("close")
    require("mini.starter").setup(opts)
  end,
}
