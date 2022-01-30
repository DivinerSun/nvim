local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = "maintained",
  sync_install = false, 
  ignore_install = { "phpdoc", "norg" }, -- List of parsers to ignore installing
  -- 需要插件 nvim-autopairs
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true },
  -- 需要插件 nvim-ts-rainbow
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  -- 需要插件 nvim-ts-context-commentstring
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  -- 需要插件 nvim-treesitter/playground
  playground = {
    enable = true
  },
}
