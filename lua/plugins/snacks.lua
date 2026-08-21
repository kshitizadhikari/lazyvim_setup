return {
  "folke/snacks.nvim",
  lazy = false,

  keys = {
    {
      "<leader>tv",
      function()
        Snacks.terminal.open(nil, {
          win = {
            position = "right",
            style = "terminal",
          },
        })
      end,
      desc = "Terminal Right",
    },

    {
      "<leader>th",
      function()
        Snacks.terminal(nil, {
          win = {
            position = "bottom",
            height = 0.3,
          },
        })
      end,
      desc = "Terminal Bottom",
    },
  },

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

          -- Show hidden files and gitignored files
          hidden = true,
          ignored = true,

          -- Ignore these directories
          exclude = {
            ".next",
            "node_modules",
          },

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
