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
