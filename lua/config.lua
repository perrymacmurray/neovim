-- utility
require('leap').add_default_mappings()

-- style
require("colors")
require("lualine").setup({
  theme = 'vscode',
  icons_enabled = true
})

-- syntax highlighting
require('treesitter')
require('ale')
