-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "L")
vim.keymap.del("n", "H")

vim.keymap.set("n", "<leader>ww", "<cmd>w<CR><ESC>", { remap = true, desc = "Save Current Buffer" })
vim.keymap.set("n", "<leader>wa", "<cmd>wa<CR><ESC>", { remap = true, desc = "Save All Buffers" })
vim.keymap.set("n", "<leader>qq", "<cmd>q<CR><ESC>", { remap = true, desc = "Close Current Buffer" })
vim.keymap.set("n", "<leader>qa", "<cmd>qa<CR><ESC>", { remap = true, desc = "Close All Buffer" })

-- buffers
vim.api.nvim_set_keymap(
  "n",
  "<leader>bb",
  "function() Snacks.picker.buffers() end",
  { noremap = false, desc = "Open Buffer List" }
)
vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", { remap = true, desc = "Next Buffer Cycle" })
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", { remap = true, desc = "Prev Buffer Cycle" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { remap = true, desc = "Delete Current Buffer " })

-- Session
-- 1. Save Session (Overwrite .session.vim)
vim.keymap.set("n", "<leader>ms", function()
  vim.cmd("mksession! .session.vim")
  vim.notify("Session saved to .session.vim", vim.log.levels.INFO)
end, { desc = "Save Session (Overwrite)" })

-- 2. Load Session (Check if exists first)
vim.keymap.set("n", "<leader>ml", function()
  if vim.fn.filereadable(".session.vim") == 1 then
    vim.cmd("source .session.vim")
    vim.notify("Session loaded", vim.log.levels.INFO)
  else
    vim.notify("No .session.vim file found", vim.log.levels.WARN)
  end
end, { desc = "Load Session" })

-- Navigate to next diff change
vim.keymap.set("n", "]c", function()
  if vim.wo.diff then
    return "]c"
  end
  return "]]"
end, { expr = true, desc = "Next diff change" })

-- Navigate to previous diff change
vim.keymap.set("n", "[c", function()
  if vim.wo.diff then
    return "[c"
  end
  return "[["
end, { expr = true, desc = "Prev diff change" })
