return {
  "jake-stewart/multicursor.nvim",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    vim.keymap.set({ "n", "x" }, "<C-d>", mc.matchAddCursor)
  end,
}
