vim.keymap.set({ "n", "x", "o" }, "j", "h", { desc = "Left" })
vim.keymap.set({ "n", "x", "o" }, "k", "k", { desc = "Up" })
vim.keymap.set({ "n", "x", "o" }, "l", "j", { desc = "Down" })
vim.keymap.set({ "n", "x", "o" }, ";", "l", { desc = "Right" })

-- Repeat last f/F/t/T search
vim.keymap.set({ "n", "x", "o" }, "'", ";", { desc = "Repeat last find" })

vim.keymap.set("n", "<leader>fg", function()
  Snacks.picker.grep()
end, { desc = "Grep" })

vim.keymap.set("n", "<C-j>", "<C-w>h")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>j")
vim.keymap.set("n", "<C-;>", "<C-w>l")
