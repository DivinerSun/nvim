require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      'mode',
    },
    lualine_b = {
      'branch',
      {
        'diff',
        colored = true, -- Displays a colored diff status if set to true
        diff_color = {
          added    = 'DiffAdd',    -- Changes the diff's added color
          modified = 'DiffChange', -- Changes the diff's modified color
          removed  = 'DiffDelete', -- Changes the diff's removed color you
        },
        symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the symbols used by the diff.
        source = nil,
      },
      
    },
    lualine_c = {
      'filesize',
      {
        'filename',
        file_status = true,      
        path = 0,                
        shorting_target = 40,    
        symbols = {
          modified = '[+]',      
          readonly = '[-]',      
          unnamed = '[No Name]',
        }
      },
      'diagnostics'
    },
    lualine_x = {
      'encoding',
      {
        'fileformat',
        symbols = {
          mac = '',  -- e711
          unix = '', -- e711
          -- unix = '', -- e712
          dos = '',  -- e70f
        }
      },
      {
        'filetype',
        colored = true,
        icon_only = false
      }
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
