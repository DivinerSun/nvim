return {
  -- 自定义颜色主题
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {
      transparent_mode = true,
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
      custom_highlights = function(C)
        return {
          Comment = { fg = C.pink, bg = C.base },
          CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
          CmpItemKindKeyword = { fg = C.base, bg = C.red },
          CmpItemKindText = { fg = C.base, bg = C.teal },
          CmpItemKindMethod = { fg = C.base, bg = C.blue },
          CmpItemKindConstructor = { fg = C.base, bg = C.blue },
          CmpItemKindFunction = { fg = C.base, bg = C.blue },
          CmpItemKindFolder = { fg = C.base, bg = C.blue },
          CmpItemKindModule = { fg = C.base, bg = C.blue },
          CmpItemKindConstant = { fg = C.base, bg = C.peach },
          CmpItemKindField = { fg = C.base, bg = C.green },
          CmpItemKindProperty = { fg = C.base, bg = C.green },
          CmpItemKindEnum = { fg = C.base, bg = C.green },
          CmpItemKindUnit = { fg = C.base, bg = C.green },
          CmpItemKindClass = { fg = C.base, bg = C.yellow },
          CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
          CmpItemKindFile = { fg = C.base, bg = C.blue },
          CmpItemKindInterface = { fg = C.base, bg = C.yellow },
          CmpItemKindColor = { fg = C.base, bg = C.red },
          CmpItemKindReference = { fg = C.base, bg = C.red },
          CmpItemKindEnumMember = { fg = C.base, bg = C.red },
          CmpItemKindStruct = { fg = C.base, bg = C.blue },
          CmpItemKindValue = { fg = C.base, bg = C.peach },
          CmpItemKindEvent = { fg = C.base, bg = C.blue },
          CmpItemKindOperator = { fg = C.base, bg = C.blue },
          CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
          CmpItemKindCopilot = { fg = C.base, bg = C.teal },
          CmpItemKindCodeium = { fg = C.base, bg = C.teal },
        }
      end,
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
          inlay_hints = {
            background = false,
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = { italic = true },
        variables = {},
        sidebars = "transparent",
        floats = "transparent",
      },
      on_colors = function(colors)
        colors.comment = "#FF81D0"
        colors.fg_gutter = "#813c85"
      end,
    },
  },
  -- 自定义Dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = [[
        $$$$$$$\  $$\            $$\                             $$\ $$\    $$\ $$\               
        $$  __$$\ \__|           \__|                            $  |$$ |   $$ |\__|              
        $$ |  $$ |$$\ $$\    $$\ $$\ $$$$$$$\   $$$$$$\   $$$$$$\\_/ $$ |   $$ |$$\ $$$$$$\$$$$\  
        $$ |  $$ |$$ |\$$\  $$  |$$ |$$  __$$\ $$  __$$\ $$  __$$\   \$$\  $$  |$$ |$$  _$$  _$$\ 
        $$ |  $$ |$$ | \$$\$$  / $$ |$$ |  $$ |$$$$$$$$ |$$ |  \__|   \$$\$$  / $$ |$$ / $$ / $$ |
        $$ |  $$ |$$ |  \$$$  /  $$ |$$ |  $$ |$$   ____|$$ |          \$$$  /  $$ |$$ | $$ | $$ |
        $$$$$$$  |$$ |   \$  /   $$ |$$ |  $$ |\$$$$$$$\ $$ |           \$  /   $$ |$$ | $$ | $$ |
        \_______/ \__|    \_/    \__|\__|  \__| \_______|\__|            \_/    \__|\__| \__| \__|
      ]]
      logo = string.rep("\n", 2) .. logo .. "\n\n"
      local opts = {
        theme = "doom",
        hide = {
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          center = {
            {
              action = "Telescope find_files",
              desc = " Find file",
              icon = " ",
              key = "f",
            },
            {
              action = "ene | startinsert",
              desc = " New file",
              icon = " ",
              key = "n",
            },
            {
              action = "Telescope oldfiles",
              desc = " Recent files",
              icon = " ",
              key = "r",
            },
            {
              action = "Telescope live_grep",
              desc = " Find text",
              icon = " ",
              key = "g",
            },
            {
              action = [[lua require("lazyvim.util").telescope.config_files()()]],
              desc = " Config",
              icon = " ",
              key = "c",
            },
            {
              action = 'lua require("persistence").load()',
              desc = " Restore Session",
              icon = " ",
              key = "s",
            },
            {
              action = "LazyExtras",
              desc = " Lazy Extras",
              icon = " ",
              key = "x",
            },
            {
              action = "Lazy",
              desc = " Lazy",
              icon = "󰒲 ",
              key = "l",
            },
            {
              action = "qa",
              desc = " Quit",
              icon = " ",
              key = "q",
            },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }
      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end
      return opts
    end,
  },
  -- 配置Noice通知消息
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = {
          skip = true,
        },
      })
      opts.presets.lsp_doc_border = true
      opts.presets.inc_rename = true
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
  -- 配置 IncLine
  {
    "b0o/incline.nvim",
    opts = function()
      local function get_diagnostic_label(props)
        local icons = {
          Error = "",
          Warn = "",
          Info = "",
          Hint = "",
        }
        local label = {}
        for severity, icon in pairs(icons) do
          local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
          if n > 0 then
            table.insert(label, { icon .. " " .. n .. " ", group = "DiagnosticSign" .. severity })
          end
        end
        return label
      end

      local opts = {
        highlight = {
          groups = {
            InclineNormal = { guibg = "#822455" },
          },
        },
        window = {
          margin = {
            horizontal = 0,
            vertical = 0,
          },
        },
        debounce_threshold = { falling = 500, rising = 250 },
        render = function(props)
          local bufname = vim.api.nvim_buf_get_name(props.buf)
          local filename = vim.fn.fnamemodify(bufname, ":t")
          local diagnostics = get_diagnostic_label(props)
          local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "None"
          local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)

          local buffer = {
            { filetype_icon, guifg = color },
            { " " },
            { filename, gui = modified },
          }

          if #diagnostics > 0 then
            table.insert(diagnostics, { "| ", guifg = "grey" })
          end
          for _, buffer_ in ipairs(buffer) do
            table.insert(diagnostics, buffer_)
          end
          return diagnostics
        end,
      }
      return opts
    end,
  },
}
