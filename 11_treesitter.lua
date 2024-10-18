local nvim_treesitter = {
  languages = {
    "ruby", "lua", "rust", "go", "gomod",
    "bash", "sql", "regex",
    "css", "html", "javascript", "json", "typescript", "vue",
    "embedded_template",
    "vim", "vimdoc"
  }
}

require('nvim-treesitter.configs').setup {
  ensure_installed = nvim_treesitter.languages,
  sync_install     = true,
  auto_install     = true,
  highlight        = { enable = true }
}
