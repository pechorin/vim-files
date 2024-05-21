require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "ruby",
    "bash",
    "lua",
    "c", "cpp",
    "go", "gomod",
    "rust",
    "css", "html", "javascript", "json", "typescript", "vue",
    "python",
    "embedded_template",
    "sql",
    "regex",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
  }
}
