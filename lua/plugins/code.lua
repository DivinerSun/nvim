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
  -- 内部终端
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 20,
      open_mapping = [[<C-t>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    },
  },
  -- 颜色插件
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufRead",
    opts = {
      user_default_options = {
        tailwind = true,
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = true,
        AARRGGBB = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        mode = "background",
        sass = { enable = true, parsers = { "css" } },
        virtualtext = "■",
      },
    },
  },
  -- 注释插件
  {
    "numToStr/Comment.nvim",
    event = "BufWinEnter",
    opts = {},
  },
  -- Flutter
  {
    "akinsho/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
    config = function()
      require("flutter-tools").setup({
        flutter_path = "/Users/diviner/fvm/default/bin/flutter",
        debugger = {
          -- make these two params true to enable debug mode
          enabled = false,
          run_via_dap = false,
          register_configurations = function(_)
            require("dap").adapters.dart = {
              type = "executable",
              command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
              args = { "flutter" },
            }
            require("dap").configurations.dart = {
              {
                type = "dart",
                request = "launch",
                name = "Launch flutter",
                dartSdkPath = "/Users/diviner/fvm/default/bin/cache/dart-sdk/",
                flutterSdkPath = "/Users/diviner/fvm/default",
                program = "${workspaceFolder}/lib/main.dart",
                cwd = "${workspaceFolder}",
              },
            }
            -- uncomment below line if you've launch.json file already in your vscode setup
            -- require("dap.ext.vscode").load_launchjs()
          end,
        },
        closing_tags = {
          highlight = "ErrorMsg",
          prefix = " ",
          enabled = true,
        },
        dev_log = {
          -- toggle it when you run without DAP
          enabled = false,
          open_cmd = "tabedit",
        },
        lsp = {
          -- on_attach = require("lazyvim.util.lsp").on_attach,
          capabilities = require("cmp_nvim_lsp").default_capabilities,
        },
      })
    end,
  },
  -- Dart插件
  {
    "dart-lang/dart-vim-plugin",
    dependencies = { "natebosch/vim-lsc", "natebosch/vim-lsc-dart" },
    config = function()
      vim.g.dart_html_in_string = true
      vim.g.dart_style_guide = 2
      vim.g.dart_trailing_comma_indent = true
      vim.g.lsc_auto_map = true
    end,
  },
}
