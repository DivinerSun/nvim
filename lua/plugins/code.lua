return {
  -- Wakatime编码时长统计
  {
    "wakatime/vim-wakatime",
    lazy = true,
  },
  -- 禅模式
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
  -- 多光标
  {
    "mg979/vim-visual-multi",
    event = "BufWinEnter",
  },
}
