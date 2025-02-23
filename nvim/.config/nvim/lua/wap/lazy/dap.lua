return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    opts = {},
    dependencies = {
      "nvim-neotest/nvim-nio",
    },
  },
  config = function()

    local dap = require("dap")
    local dapui = require("dapui")

    local HOME = os.getenv("HOME")
    local DEBUGGER_LOCATION = HOME .. "/.local/share/nvim/netcoredbg"

    dap.adapters.coreclr = {
      type = "executable",
      command = DEBUGGER_LOCATION .. "/netcoredbg",
      args = { "--interpreter=vscode" },
    }

    vim.g.dotnet_build_project = function()
      local default_path = vim.fn.getcwd() .. "/"
      if vim.g["dotnet_last_proj_path"] ~= nil then
        default_path = vim.g["dotnet_last_proj_path"]
      end
      local path = vim.fn.input("Path to your *proj file", default_path, "file")
      vim.g["dotnet_last_proj_path"] = path
      local cmd = "dotnet build -c Debug " .. path .. " > /dev/null"
      print("")
      print("Cmd to execute: " .. cmd)
      local f = os.execute(cmd)
      if f == 0 then
        print("\nBuild: ✔️ ")
      else
        print("\nBuild: ❌ (code: " .. f .. ")")
      end
    end

    vim.g.dotnet_get_dll_path = function()
      local request = function()
        return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
      end

      if vim.g["dotnet_last_dll_path"] == nil then
        vim.g["dotnet_last_dll_path"] = request()
      else
        if
          vim.fn.confirm(
            "Do you want to change the path to dll?\n" .. vim.g["dotnet_last_dll_path"],
            "&yes\n&no",
            2
          ) == 1
        then
          vim.g["dotnet_last_dll_path"] = request()
        end
      end

      return vim.g["dotnet_last_dll_path"]
    end

    local config = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
          if vim.fn.confirm("Should I recompile first?", "&yes\n&no", 2) == 1 then
            vim.g.dotnet_build_project()
          end
          return vim.g.dotnet_get_dll_path()
        end,
      },
    }

    dap.configurations.cs = config
    dap.configurations.fsharp = config

    vim.keymap.set('n', '<F5>', function() dap.continue() end)
    vim.keymap.set('n', '<F10>', function() dap.step_over() end)
    vim.keymap.set('n', '<F11>', function() dap.step_into() end)
    vim.keymap.set('n', '<F12>', function() dap.step_out() end)
    vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
    vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
    vim.keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
    vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)


    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
     dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
     dapui.close()
    end
  end,
}
