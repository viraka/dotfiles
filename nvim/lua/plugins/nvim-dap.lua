-- Debugging: nvim-dap + dap-ui, configured for JavaScript/TypeScript via the
-- js-debug-adapter (the same engine VS Code uses). Covers Node (server) and
-- Chrome (client) launch configs for a Next.js app.
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
      "mason-org/mason.nvim",
    },
    keys = {
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue / Start",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle breakpoint",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step into",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step over",
      },
      {
        "<leader>dO",
        function()
          require("dap").step_out()
        end,
        desc = "Step out",
      },
      {
        "<leader>dt",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
      {
        "<leader>du",
        function()
          require("dapui").toggle()
        end,
        desc = "Toggle DAP UI",
      },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      -- Auto open/close the debug UI alongside a session.
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- Mason puts its binaries on Neovim's PATH, so exepath() finds the adapter
      -- once `js-debug-adapter` has been installed (see the mason spec below).
      local js_debug = vim.fn.exepath("js-debug-adapter")
      for _, adapter in ipairs({ "pwa-node", "pwa-chrome" }) do
        dap.adapters[adapter] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = js_debug,
            args = { "${port}" },
          },
        }
      end

      for _, ft in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
        dap.configurations[ft] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch current file (Node)",
            program = "${file}",
            cwd = "${workspaceFolder}",
            sourceMaps = true,
          },
          {
            -- For server-side Next.js: start `NODE_OPTIONS='--inspect' next dev`,
            -- then run this to attach to the running process.
            type = "pwa-node",
            request = "attach",
            name = "Attach to Node process",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
            sourceMaps = true,
          },
          {
            -- For client-side Next.js: run `next dev`, then launch Chrome here.
            type = "pwa-chrome",
            request = "launch",
            name = "Next.js: debug client in Chrome (localhost:3000)",
            url = "http://localhost:3000",
            webRoot = "${workspaceFolder}",
            sourceMaps = true,
          },
        }
      end
    end,
  },

  -- Install the JS debug adapter binary.
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "js-debug-adapter")
      return opts
    end,
  },
}
