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

          -- Show hidden files and gitignored files
          hidden = true,
          ignored = true,

          -- Ignore these directories
          exclude = {
            ".next",
            "node_modules",
            ".data",
            ".git",
            ".idea",
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

  config = function(_, opts)
    -- Setup Snacks
    require("snacks").setup(opts)

    ---------------------------------------------------------------------------
    -- Toggle ALL terminals
    ---------------------------------------------------------------------------

    local function toggle_all_terminals()
      local terminals = Snacks.terminal.list()

      -- No terminals exist yet.
      if #terminals == 0 then
        Snacks.terminal.open(nil, {
          win = {
            position = "bottom",
            height = 0.2,
            style = "terminal",
          },
        })
        return
      end

      -- Check whether at least one terminal is currently visible.
      local any_visible = false

      for _, term in ipairs(terminals) do
        if vim.fn.bufwinid(term.buf) ~= -1 then
          any_visible = true
          break
        end
      end

      if any_visible then
        -----------------------------------------------------------------------
        -- At least one terminal is visible.
        -- Hide ALL terminals.
        -----------------------------------------------------------------------

        for _, term in ipairs(terminals) do
          if vim.fn.bufwinid(term.buf) ~= -1 then
            term:hide()
          end
        end
      else
        -----------------------------------------------------------------------
        -- No terminal is visible.
        -- Show ALL terminals.
        -----------------------------------------------------------------------

        for _, term in ipairs(terminals) do
          term:show()
        end
      end
    end

    ---------------------------------------------------------------------------
    -- IMPORTANT:
    -- Snacks has built-in mappings for BOTH <C-/> and <C-_>.
    -- Override both so the built-in per-terminal toggle cannot win.
    ---------------------------------------------------------------------------

    vim.keymap.set({ "n", "t" }, "<C-/>", toggle_all_terminals, {
      desc = "Toggle All Terminals",
    })

    vim.keymap.set({ "n", "t" }, "<C-_>", toggle_all_terminals, {
      desc = "Toggle All Terminals",
    })

    ---------------------------------------------------------------------------
    -- Terminal Right
    ---------------------------------------------------------------------------

    vim.keymap.set("n", "<leader>tv", function()
      if vim.bo.filetype ~= "snacks_terminal" then
        Snacks.notify.warn("Open a terminal first with Ctrl+/")
        return
      end

      -- Split the current terminal vertically.
      vim.cmd("vsplit")

      -- Put a new Snacks terminal in that split.
      Snacks.terminal.open(nil, {
        win = {
          position = "current",
          style = "terminal",
        },
      })
    end, {
      desc = "Terminal Right",
    })

    ---------------------------------------------------------------------------
    -- Terminal Bottom
    ---------------------------------------------------------------------------

    vim.keymap.set("n", "<leader>th", function()
      Snacks.terminal.open(nil, {
        win = {
          position = "bottom",
          height = 0.3,
          style = "terminal",
        },
      })
    end, {
      desc = "Terminal Bottom",
    })
  end,
}
