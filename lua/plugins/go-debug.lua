return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")

      dap.adapters.delve = {
        type = "server",
        host = "127.0.0.1",
        port = 2345,
      }

      dap.configurations.go = {
        {
          type = "delve",
          name = "Attach to Docker",
          request = "attach",
          mode = "remote",

          substitutePath = {
            {
              from = vim.fn.getcwd(),
              to = "/app",
            },
          },
        },
      }
    end,
  },
}
