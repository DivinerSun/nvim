return {
  -- 自定义颜色主题
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
