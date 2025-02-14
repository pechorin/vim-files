require("neo-tree").setup({
  enable_git_status = true,
  window            = { width = 30 },
  default_component_configs = {
    container = { enable_character_fade = false },
    indent    = { indent_size = 1, padding = 0, with_markers = false, },
    icon      = { folder_closed = ">", folder_open = "-", folder_empty = "ﰊ", },
    modified  = { symbol = "[+]" }
  },
  filesystem = {
    filtered_items = {
      visible         = false,
      hide_dotfiles   = false,
      hide_gitignored = false,
      hide_by_name    = { "node_modules", "tags", },
      never_show      = { ".DS_Store" }
    },
    follow_current_file  = { enabled = true }, use_libuv_file_watcher = true,
  },
  source_selector = {
    winbar = true,
    sources = {
      { source = "filesystem" },
      { source = "buffers" },
      { source = "git_status" },
      { source = "document_symbols" },
    },
  },
  sources = { "filesystem", "buffers", "git_status", "document_symbols" }
})
