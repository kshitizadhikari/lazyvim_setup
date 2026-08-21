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

-- ============================================================
-- Buffer navigation in current split (wraps to split at the edges)
-- ============================================================
local function listed_buffers()
  local bufs = {}
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buflisted then
      table.insert(bufs, buf)
    end
  end
  return bufs
end

local function current_index(bufs)
  local cur = vim.api.nvim_get_current_buf()
  for i, b in ipairs(bufs) do
    if b == cur then
      return i
    end
  end
end

local function buffer_next_or_split()
  local bufs = listed_buffers()
  local idx = current_index(bufs)
  if idx and idx < #bufs then
    vim.cmd("BufferLineCycleNext")
  else
    vim.cmd("wincmd l") -- move to split on the right
  end
end

local function buffer_prev_or_split()
  local bufs = listed_buffers()
  local idx = current_index(bufs)
  if idx and idx > 1 then
    vim.cmd("BufferLineCyclePrev")
  else
    vim.cmd("wincmd h") -- move to split on the left
  end
end

vim.keymap.set("n", "<C-;>", buffer_next_or_split, { desc = "Next buffer (or right split at end)" })
vim.keymap.set("n", "<C-j>", buffer_prev_or_split, { desc = "Prev buffer (or left split at start)" })

-- ============================================================
-- Split navigation (Ctrl+Shift)
-- ============================================================
vim.keymap.set("n", "<C-S-j>", "<C-w>h", { desc = "Window Left" })
vim.keymap.set("n", "<C-S-k>", "<C-w>k", { desc = "Window Up" })
vim.keymap.set("n", "<C-S-l>", "<C-w>j", { desc = "Window Down" })
vim.keymap.set("n", "<C-S-;>", "<C-w>l", { desc = "Window Right" })

-- Fallback: some terminals send Shift+; as ':' instead of a real S- modifier
vim.keymap.set("n", "<C-:>", "<C-w>l", { desc = "Window Right (fallback)" })

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
--
vim.keymap.set("n", "'", "`", { remap = true })
vim.keymap.set("n", "<Esc>", function()
  vim.cmd("let @/ = ''")
  vim.cmd("nohlsearch")
end)
