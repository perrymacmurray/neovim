-- utility
require('leap')
require('blame_config')

-- style
require("colors_config")
require("lualine").setup({
  theme = 'vscode',
  icons_enabled = true
})

-- syntax highlighting
require('treesitter_config')
require('ale_config')
