return {
  -- 自定义Neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = {},
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    opts = {
      enable_git_status = true,
      enable_diagnostics = true,
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      window = {
        position = "float",
        width = 40,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["<space>"] = "none",
          ["<2-LeftMouse>"] = "open",
          ["<cr>"] = "open",
          ["l"] = "open",
          ["<esc>"] = "revert_preview",
          ["P"] = { "toggle_preview", config = { use_float = true } },
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["t"] = "open_tabnew",
          ["w"] = "open_with_window_picker",
          ["C"] = "close_node",
          ["h"] = "close_node",
          ["z"] = "close_all_nodes",
          ["Z"] = "expand_all_nodes",
          ["a"] = {
            "add",
            config = {
              show_path = "none",
            },
          },
          ["A"] = "add_directory",
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy",
          ["m"] = "move",
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["?"] = "show_help",
          ["<"] = "prev_source",
          [">"] = "next_source",
        },
      },
    },
  },
  -- 文件顶部面包屑
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
    opts = {
      lsp = {
        auto_attach = true,
        preference = nil,
      },
      highlight = true,
    },
  },
  -- 配置变量重命名插件
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  -- 状态栏配置
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      vim.o.laststatus = vim.g.lualine_laststatus

      local icons = require("custom.icons")
      local hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end

      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
          local filepath = vim.fn.expand("%:p:h")
          local gitdir = vim.fn.finddir(".git", filepath .. ";")
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
      }

      local diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn" },
        symbols = {
          error = icons.diagnostics.BoldError .. " ",
          warn = icons.diagnostics.BoldWarning .. " ",
        },
        colored = true,
        update_in_insert = false,
        always_visible = false,
      }

      local diff = {
        "diff",
        colored = true,
        symbols = {
          added = icons.git.LineAdded .. " ",
          modified = icons.git.LineModified .. " ",
          removed = icons.git.LineRemoved .. " ",
        },
        cond = hide_in_width,
      }

      local mode = {
        "mode",
        fmt = function(str)
          return "--" .. str .. "--"
        end,
      }

      local fileType = {
        "filetype",
        icons_enabled = true,
        icon = nil,
      }

      local branch = {
        "branch",
        icons_enabled = true,
        icon = icons.git.Branch,
      }

      local location = {
        "location",
        padding = 1,
        color = { fg = "#FFFFFF", bg = "#d86079" },
      }

      -- cool function for progress
      local progress = function()
        local current_line = vim.fn.line(".")
        local total_lines = vim.fn.line("$")
        local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
        local line_ratio = current_line / total_lines
        local index = math.ceil(line_ratio * #chars)
        return chars[index]
      end

      local spaces = function()
        return icons.ui.Tab .. " " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
      end

      local file_name = {
        "filename",
        cond = conditions.buffer_not_empty,
      }

      -- start for lsp
      local list_registered_providers_names = function(filetype)
        local s = require("null-ls.sources")
        local available_sources = s.get_available(filetype)
        local registered = {}
        for _, source in ipairs(available_sources) do
          for method in pairs(source.methods) do
            registered[method] = registered[method] or {}
            table.insert(registered[method], source.name)
          end
        end
        return registered
      end

      local null_ls = require("null-ls")
      -- for formatter
      local list_registered = function(filetype)
        local method = null_ls.methods.FORMATTING
        local registered_providers = list_registered_providers_names(filetype)
        return registered_providers[method] or {}
      end

      --- for linter
      local alternative_methods = {
        null_ls.methods.DIAGNOSTICS,
        null_ls.methods.DIAGNOSTICS_ON_OPEN,
        null_ls.methods.DIAGNOSTICS_ON_SAVE,
      }

      local linter_list_registered = function(filetype)
        local registered_providers = list_registered_providers_names(filetype)
        local providers_for_methods = vim.tbl_flatten(vim.tbl_map(function(m)
          return registered_providers[m] or {}
        end, alternative_methods))

        return providers_for_methods
      end

      local lsp_info = {
        function()
          local msg = "[ LS Inactive ]"
          local buf_ft = vim.bo.filetype
          local buf_clients = vim.lsp.get_active_clients()
          local buf_client_names = {}
          if next(buf_clients) == nil then
            if type(msg) == "boolean" or #msg == 0 then
              return "[ LS Inactive ]"
            end
            return msg
          end
          for _, client in pairs(buf_clients) do
            if client.name ~= "null-ls" and client.name ~= "copilot" then
              table.insert(buf_client_names, client.name)
            end
          end
          local supported_formatters = list_registered(buf_ft)
          vim.list_extend(buf_client_names, supported_formatters)
          local supported_linters = linter_list_registered(buf_ft)
          vim.list_extend(buf_client_names, supported_linters)
          local unique_client_names = vim.fn.uniq(buf_client_names)
          msg = table.concat(unique_client_names, ", ")
          return "[" .. msg .. "]"
        end,
        icon = icons.ui.Gear .. "",
      }

      return {
        options = {
          theme = "tokyonight",
          globalstatus = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            "TelescopePrompt",
            "packer",
            "alpha",
            "dashboard",
            "NvimTree",
            "Outline",
            "DressingInput",
            "toggleterm",
            "lazy",
            "mason",
            statusline = { "dashboard", "alpha", "starter" },
          },
          icons_enabled = true,
          always_divide_middle = true,
        },
        sections = {
          lualine_a = {
            {
              "fileformat",
              symbols = {
                mac = "", -- e711
                unix = "", -- e711
                dos = "", -- e70f
                lunix = "", -- e712
              },
            },
            branch,
          },
          lualine_b = { mode },
          lualine_c = { diagnostics, diff },
          lualine_x = {
            lsp_info,
            spaces,
            "encoding",
            require("lazyvim.util").lualine.cmp_source("codeium"),
            fileType,
            "filesize",
          },
          lualine_y = { location },
          lualine_z = { { progress, color = { fg = "#FF99CC" } } },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { file_name },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = { "neo-tree", "lazy" },
      }
    end,
  },
}
