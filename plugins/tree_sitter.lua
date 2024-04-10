require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "c", "cpp", "lua", "bash", "ruby",
    "go", "rust", "css", "html", "javascript", "json", "regex", "typescript", "vue", "python", "embedded_template", "sql" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
  }
}
