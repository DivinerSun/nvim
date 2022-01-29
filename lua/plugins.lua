local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- 插件配置[[start]]
  
  -- Packer
  use "wbthomason/packer.nvim"
  
  -- 编码时长统计
  use 'wakatime/vim-wakatime'

  -- LSP Install插件
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }

  -- 主题插件
  use 'folke/tokyonight.nvim'

  -- NvimTree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
  }

  -- StatusLine插件
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Indent
  use "lukas-reineke/indent-blankline.nvim"

  -- Tabline插件
  use 'romgrk/barbar.nvim'

  -- Git插件
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  } 
  
  -- 插件配置[[end]]

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
