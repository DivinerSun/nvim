-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- ESC常用映射
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)
keymap("i", "jj", "<ESC>", opts)
keymap("i", "kk", "<ESC>o", opts)
keymap("v", "q", "<ESC>", opts)

-- 快速跳转
keymap("n", "<C-h>", "^", opts)
keymap("n", "<C-l>", "$", opts)
keymap("v", "<C-h>", "^", opts)
keymap("v", "<C-l>", "$", opts)
keymap("n", "<C-j>", "5j", opts)
keymap("n", "<C-k>", "5k", opts)
keymap("v", "<C-j>", "5j", opts)
keymap("v", "<C-k>", "5k", opts)

-- Buffer操作
keymap("n", "<A-l>", ":bnext<CR>", opts)
keymap("n", "<A-h>", ":bprevious<CR>", opts)
keymap("n", "<S-q>", ":bdelete<CR>", opts)

-- 重命名快捷键
keymap("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
