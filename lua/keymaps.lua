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
-- 上下多行快速跳转
keymap("n", "<C-j>", "5j", opts)
keymap("n", "<C-k>", "5k", opts)
keymap("v", "<C-j>", "5j", opts)
keymap("v", "<C-k>", "5k", opts)
-- 行首行尾快捷键
keymap("i", "<C-h>", "<Home>", opts)
keymap("i", "<C-l>", "<End>", opts)
keymap("n", "<C-h>", "<S-^>", opts)
keymap("n", "<C-l>", "<S-$>", opts)
keymap("v", "<C-h>", "<S-^>", opts)
keymap("v", "<C-l>", "<S-$>", opts)

-- 缩进快捷键
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- 切换NvimTree
keymap("n", "<leader>e", ":lua require'tabline/tree'.toggle_tree()<CR>", opts)

-- 保存文件
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":wq<CR>", opts)

-- 移动行
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

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

-- Gitsigns
keymap('n', '<leader>g', ':Gitsigns blame_line<CR>', opts)
keymap('n', '<leader>tb', ':Gitsigns toggle_current_line_blame<CR>', opts)


