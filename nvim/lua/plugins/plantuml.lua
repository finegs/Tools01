-- lua/plugins/plantuml.lua
return {
  "weirongxu/plantuml-previewer.vim",
  ft = "plantuml",
  dependencies = { "tyru/open-browser.vim", "aklt/plantuml-syntax" },

  config = function()
    local myutils = require("mymodule.utils")

    -- 1. Cross-platform PlantUML JAR Path resolution (Windows & Linux)
    local env_jar = os.getenv("PLANTUML_JAR_PATH")
    local candidates = {}

    if env_jar and env_jar ~= "" then
      table.insert(candidates, env_jar)
    end

    if myutils.is.windows then
      table.insert(candidates, "C:/Programs/share/plantuml/plantuml-gplv2-1.2025.10.jar")
      table.insert(candidates, "C:/Tools/plantuml.jar")
      table.insert(candidates, "C:/Program Files/plantuml/plantuml.jar")
      vim.g["plantuml_previewer#viewer_path"] = [[C:\Dev\temp\puml_viewer]]
    else
      -- Linux candidate paths
      table.insert(candidates, vim.fn.expand("~/.local/share/plantuml/plantuml.jar"))
      table.insert(candidates, "/usr/share/plantuml/plantuml.jar")
      table.insert(candidates, "/usr/share/java/plantuml.jar")
      table.insert(candidates, "/usr/local/share/plantuml/plantuml.jar")
      table.insert(candidates, "/opt/homebrew/opt/plantuml/libexec/plantuml.jar")
    end

    local found_jar = nil
    for _, path in ipairs(candidates) do
      if vim.fn.filereadable(path) == 1 then
        found_jar = path
        break
      end
    end

    -- Default fallback if no file is currently readable at runtime
    if not found_jar then
      found_jar = candidates[1] or (myutils.is.windows and "C:/Tools/plantuml.jar" or "/usr/share/plantuml/plantuml.jar")
    end

    vim.g["plantuml_previewer#plantuml_jar_path"] = found_jar

    -- 2. Browser opener configuration (Windows vs Linux)
    if myutils.is.windows then
      vim.g.openbrowser_browser_commands = {
        {
          name = "windows_opener",
          args = { "cmd.exe", "/c", "start", "", "{uri}" },
        },
      }
    elseif myutils.is.linux then
      vim.g.openbrowser_browser_commands = {
        {
          name = "linux_opener",
          args = { "xdg-open", "{uri}" },
        },
      }
    end
  end,

  keys = {
    { "<leader>cp", "<cmd>PlantumlOpen<cr>", desc = "PlantUML Preview" },
  },
}
