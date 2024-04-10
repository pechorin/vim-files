-- Telescope
local telescope = require('telescope')

telescope.load_extension('themes')
telescope.load_extension('telescope-alternate')
telescope.load_extension("git_file_history")

telescope.setup({
  defaults = {
    layout_config = {
      vertical = { width = 0.6 },
      horizontal = { width = 0.5 }
    }
  },
  pickers = {
    buffers = { theme = "dropdown" },
    find_files = { theme = "dropdown" }
  },
  extensions = {
    themes = {
      layout_config = {
          horizontal = {
              width = 0.3,
              height = 0.5,
          },
      },
      enable_previewer = false,
      enable_live_preview = true,
      persist = { enable = false }
    },
    ["telescope-alternate"] = {
      -- TODO: setup: https://github.com/otavioschwanck/telescope-alternate.nvim
      -- mappings = {
      --   ...your mappings
      -- },
      presets = { 'rails', 'rspec' }
    },
  }
})
