return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      win = {
        input = {
          keys = {
            ["l"] = { "list_down", mode = { "i", "n" } },
            ["k"] = { "list_up", mode = { "i", "n" } },
          },
        },
      },
    },

    explorer = {
      layout = {
        layout = {
          position = "right",
        },
      },
    },
  },
}
