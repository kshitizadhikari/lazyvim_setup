return {
  "folke/snacks.nvim",
  lazy = false,

  opts = {
    picker = {
      win = {
        input = {
          keys = {
            ["l"] = { "list_down", mode = "n" },
            ["k"] = { "list_up", mode = "n" },
          },
        },

        list = {
          keys = {
            ["k"] = "list_up",
            ["l"] = "list_down",
            [";"] = "confirm",
          },
        },
      },

      sources = {
        explorer = {
          follow_file = true,

          layout = {
            preset = "sidebar",
            layout = {
              position = "right",
              width = 30,
            },
          },

          win = {
            list = {
              keys = {
                ["k"] = "list_up",
                ["l"] = "list_down",
                [";"] = "confirm",
                ["j"] = "explorer_up",
              },
            },
          },
        },
      },
    },
  },
}
