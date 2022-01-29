local opts = { noremap = true, silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 常用快捷键
keymap("i", "jk", "<ESC>", opts)
keymap("i", "jj", "<ESC>", opts)

keymap("n", "<C-j>", "5j", opts)
keymap("n", "<C-k>", "5k", opts)
keymap("v", "<C-j>", "5j", opts)
keymap("v", "<C-k>", "5k", opts)

-- 切换NvimTree
keymap("n", "<leader>e", ":lua require'tabline/tree'.toggle_tree()<CR>", opts)

-- 保存文件
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":wq<CR>", opts)

-- 拆分窗口之间移动
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- 切换Buffer
keymap("n", "<S-l>", ":BufferNext<CR>", opts)
keymap("n", "<S-h>", ":BufferPrevious<CR>", opts)
-- 移动Buffer窗口的顺序
keymap('n', '<S-k>', ':BufferMovePrevious<CR>', opts)
keymap('n', '<S-j>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
keymap('n', '<A-1>', ':BufferGoto 1<CR>', opts)
keymap('n', '<A-2>', ':BufferGoto 2<CR>', opts)
keymap('n', '<A-3>', ':BufferGoto 3<CR>', opts)
keymap('n', '<A-4>', ':BufferGoto 4<CR>', opts)
keymap('n', '<A-5>', ':BufferGoto 5<CR>', opts)
keymap('n', '<A-6>', ':BufferGoto 6<CR>', opts)
keymap('n', '<A-7>', ':BufferGoto 7<CR>', opts)
keymap('n', '<A-8>', ':BufferGoto 8<CR>', opts)
keymap('n', '<A-9>', ':BufferGoto 9<CR>', opts)
keymap('n', '<A-0>', ':BufferLast<CR>', opts)
-- 关闭Buffer
-- 关闭当前Buffer
keymap('n', '<S-q>', ':BufferClose<CR>', opts)
-- 关闭当前Buffer右侧的Buffer
keymap('n', '<leader>l', ':BufferCloseBuffersRight<CR>', opts)
-- 关闭当前Buffer左侧的Buffer
keymap('n', '<leader>h', ':BufferCloseBuffersLeft<CR>', opts)
-- 关闭其他Buffer不关闭当前Buffer
keymap('n', '<leader>o', ':BufferCloseAllButCurrent<CR>', opts)


