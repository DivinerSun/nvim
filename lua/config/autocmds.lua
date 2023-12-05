-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local WinBar = require("custom.winbar")

vim.api.nvim_create_augroup("_winbar", {})
vim.api.nvim_create_autocmd(
  { "CursorHoldI", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
  {
    group = "_winbar",
    callback = function()
      local status_ok, _ = pcall(vim.api.nvim_buf_get_var, 0, "lsp_floating_window")
      if not status_ok then
        WinBar.get_winbar()
      end
    end,
  }
)
