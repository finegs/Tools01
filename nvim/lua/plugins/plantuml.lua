-- lua/plugins/plantuml.lua
return {
  "weirongxu/plantuml-previewer.vim",
  ft = "plantuml",
  dependencies = { "tyru/open-browser.vim", "aklt/plantuml-syntax" },

  config = function()
    -- 1. PlantUML JAR Path (ensure this matches your file!)
    vim.g["plantuml_previewer#plantuml_jar_path"] = "C:/Tools/plantuml.jar"

    -- 2. THE FIX: Explicitly define how to open URLs on Windows
    -- "cmd.exe /c start" acts like double-clicking a file in Explorer.
    vim.g.openbrowser_browser_commands = {
      {
        name = "windows_opener",
        -- Note: The empty string "" in the middle is CRITICAL.
        -- It serves as the (required) window title argument for the 'start' command.
        args = { "cmd.exe", "/c", "start", "", "{uri}" },
      },
    }
  end,

  keys = {
    { "<leader>cp", "<cmd>PlantumlOpen<cr>", desc = "PlantUML Preview" },
  },
}
