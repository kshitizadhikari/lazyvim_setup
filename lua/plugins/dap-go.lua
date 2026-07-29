return {
  {
    "leoluz/nvim-dap-go",
    opts = function(_, opts)
      opts.dap_configurations = opts.dap_configurations or {}

      table.insert(opts.dap_configurations, {
        type = "go",
        name = "Debug API",
        request = "launch",
        program = "${workspaceFolder}/cmd/api",
      })
    end,
  },
}
