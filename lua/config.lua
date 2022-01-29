-- 设置 Leader 键
vim.g.mapleader = " "
-- 设置行号
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 4

vim.o.termguicolors = true
vim.o.cmdheight = 2
vim.o.completeopt = "menuone"	-- "noselect"
vim.o.conceallevel = 0

-- 设置不生成备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- 设置允许访问系统剪贴板
vim.o.clipboard = "unnamedplus"
-- 设置文件编码
vim.o.fileencoding = "utf-8"
-- 设置搜索 高亮显示
vim.o.hlsearch = true
-- 设置搜索 是否不区分大小写
vim.o.ignorecase = false
-- 设置是否可使用鼠标操作 a: 可以， c：不可以
vim.o.mouse = "c"
-- 设置弹出菜单的高度
vim.o.pumheight = 10
-- 设置tab相关
vim.o.showtabline = 2
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
-- 设置当前行
vim.o.cursorline = true
vim.o.wrap = false
-- 设置拆分窗口位置
vim.o.splitbelow = true
vim.o.splitright = true
-- Times
vim.o.timeoutlen = 100
vim.o.updatetime = 300

-- 加载其他自定义配置
require('theme')
require('nvimtree')
require('statusline')
require('indent')
require('git')


