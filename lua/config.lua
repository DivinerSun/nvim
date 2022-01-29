-- 设置 Leader 键
-- 设置行号
vim.o.number = true
vim.o.relativenumber = true

vim.g.termguicolors = true

-- 加载其他自定义配置
require('theme')
require('nvimtree')
require('statusline')
require('indent')

