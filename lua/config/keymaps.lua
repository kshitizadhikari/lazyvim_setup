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

-- ============================================================
-- Window Navigation (Ctrl)
-- ============================================================

vim.keymap.set("n", "<C-j>", "<C-w>h", { desc = "Window Left" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window Up" })
vim.keymap.set("n", "<C-l>", "<C-w>j", { desc = "Window Down" })
vim.keymap.set("n", "<C-;>", "<C-w>l", { desc = "Window Right" })

-- Some terminals send Ctrl+Shift+; as <C-:>
vim.keymap.set("n", "<C-:>", "<C-w>l", { desc = "Window Right" })

-- ============================================================
-- Buffer Navigation (Shift)
-- ============================================================

vim.keymap.set("n", "<leader>bj", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>b;", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })

-- vim.keymap.set("n", "<leader>tv", function()
--   vim.cmd("vsplit")
--   vim.cmd("terminal")
--   vim.cmd("startinsert")
-- end, { desc = "New terminal (vertical)" })
--
-- vim.keymap.set("n", "<leader>th", function()
--   vim.cmd("split")
--   vim.cmd("terminal")
--   vim.cmd("startinsert")
-- end, { desc = "New terminal (horizontal)" })
--
-- vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
