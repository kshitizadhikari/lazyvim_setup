return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      -- Configure the picker windows
      win = {
        input = {
          keys = {
            ["l"] = { "list_down", mode = { "i", "n" } },
            ["k"] = { "list_up", mode = { "i", "n" } },
          },
        },
      },

      -- Configure the explorer source specifically
      sources = {
        explorer = {
          layout = {
            preset = "sidebar", -- Use a preset or define custom layout
            layout = {
              position = "right",
              width = 30, -- Set width if you want
            },
          },
        },
      },
    },
  },
}
