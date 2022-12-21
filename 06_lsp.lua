local lsp_config = require('lspconfig')

vim.lsp.set_log_level("debug")

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap=true, silent=true }

  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- require "lsp_signature".on_attach({
  --   bind = true,
  --   hint_prefix = "🔸",
  --   max_width = 70,
  --   extra_trigger_chars = {","},
  --   handler_opts = {
  --     border = "shadow"
  --   }
  -- })
end

lsp_config.rust_analyzer.setup {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    on_attach = on_attach,
    root_dir = lsp_config.util.root_pattern("Cargo.toml", "rust-project.json"),
    settings = {
      ["rust-analyzer"] = {
          assist = {
              importMergeBehavior = "last",
              importPrefix = "by_self",
          },
          cargo = {
              loadOutDirsFromCheck = true
          },
          procMacro = {
              enable = true
          },
      }
  }
}

lsp_config.gopls.setup {
  on_attach = on_attach
}

-- TODO: this is crap :)
lsp_config.solargraph.setup {
  cmd = {vim.fn.getenv('HOME') .. '/.rbenv/versions/2.7.6/bin/solargraph', 'stdio'},
  on_attach = on_attach,
  settings = {
    commandPath = vim.fn.getenv('HOME') .. '/.rbenv/versions/2.7.6/bin/solargraph',
    useBunlder = true,
  }
}

require('go').setup({
  goimport='goimports', -- goimport command
  gofmt = 'gofmt', --gofmt cmd,
  max_line_len = 120, -- max line length in goline format
  tag_transform = false, -- tag_transfer  check gomodifytags for details
  test_template = '', -- default to testify if not set; g:go_nvim_tests_template  check gotests for details
  test_template_dir = '', -- default to nil if not set; g:go_nvim_tests_template_dir  check gotests for details
  comment_placeholder = '' ,  -- comment_placeholder your cool placeholder
  verbose = false,  -- output loginf in messages
  lsp_cfg = true, -- true: apply go.nvim non-default gopls setup
  lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = true, -- if a on_attach function provided:  attach on_attach function to gopls
                        -- true: will use go.nvim on_attach if true
                        -- nil/false do nothing
  gopls_cmd = nil,
  lsp_diag_hdlr = true, -- hook lsp diag handler
  dap_debug = false, -- set to true to enable dap
  dap_debug_keymap = true, -- set keymaps for debugger
  dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
  dap_debug_vt = true, -- set to true to enable dap virtual text
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- delay update diagnostics
    update_in_insert = false,
  }
)

vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- vim dev
lsp_config.vimls.setup({})

-- nvim dev
require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})

lsp_config.sumneko_lua.setup({})
