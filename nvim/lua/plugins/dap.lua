-- lua/plugins/dap.lua
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "jbyuki/one-small-step-for-vimkind",
      "mfussenegger/nvim-dap-python",
    },
    keys = {
      { "<F5>", function() require("dap").continue() end, desc = "Debug: Start/Continue" },
      { "<F10>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
      { "<F11>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
      { "<F12>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Debug: Conditional Breakpoint",
      },
      { "<leader>du", function() require("dapui").toggle() end, desc = "Debug: Toggle DAP UI" },
      { "<leader>dr", function() require("dap").repl.open() end, desc = "Debug: Open REPL" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Debug: Run Last" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Debug: Terminate Session" },
      {
        "<leader>dO",
        function()
          require("osv").launch({ port = 8086 })
        end,
        desc = "Debug: Launch Lua Server (osv)",
      },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- 1. Setup DAP UI & Virtual Text
      dapui.setup()
      require("nvim-dap-virtual-text").setup({})

      -- Auto open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- 2. Define Custom Breakpoint Signs
      vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "🟡", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapLogPoint", { text = "ℹ️", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "⚪", texthl = "", linehl = "", numhl = "" })

      -- =======================================================================
      -- ADAPTER CONFIGURATIONS
      -- =======================================================================

      -- -----------------------------------------------------------------------
      -- 1. C / C++ / Rust (codelldb)
      -- -----------------------------------------------------------------------
      local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
      local codelldb_cmd = is_windows and "codelldb.cmd" or "codelldb"

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = codelldb_cmd,
          args = { "--port", "${port}" },
        },
      }

      local cpp_config = {
        {
          name = "Launch executable (codelldb)",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
        {
          name = "Attach to process (codelldb)",
          type = "codelldb",
          request = "attach",
          pid = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
      }

      dap.configurations.cpp = cpp_config
      dap.configurations.c = cpp_config
      dap.configurations.rust = cpp_config

      -- -----------------------------------------------------------------------
      -- 2. Python (debugpy)
      -- -----------------------------------------------------------------------
      local python_adapter = is_windows and "python.exe" or "python3"
      local mason_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/" .. (is_windows and "Scripts/python.exe" or "bin/python")

      if vim.fn.filereadable(mason_path) == 1 then
        require("dap-python").setup(mason_path)
      else
        require("dap-python").setup(python_adapter)
      end

      -- -----------------------------------------------------------------------
      -- 3. JavaScript / TypeScript (js-debug-adapter)
      -- -----------------------------------------------------------------------
      local js_adapter_cmd = is_windows and "js-debug-adapter.cmd" or "js-debug-adapter"

      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = js_adapter_cmd,
          args = { "${port}" },
        },
      }

      local js_config = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file (Node.js)",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach to Node process",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
      }

      for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
        dap.configurations[language] = js_config
      end

      -- -----------------------------------------------------------------------
      -- 4. Lua (one-small-step-for-vimkind / osv)
      -- -----------------------------------------------------------------------
      dap.adapters.nlua = function(callback, config)
        callback({
          type = "server",
          host = config.host or "127.0.0.1",
          port = config.port or 8086,
        })
      end

      dap.configurations.lua = {
        {
          type = "nlua",
          request = "attach",
          name = "Attach to running Neovim instance (osv)",
          host = function()
            return "127.0.0.1"
          end,
          port = function()
            return 8086
          end,
        },
      }
    end,
  },
}
