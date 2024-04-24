local lsp_config = require('lspconfig')

vim.lsp.set_log_level("debug")

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = false,
  update_in_insert = false,
  severity_sort = false,
  float = false
})

local on_attach = function(client, bufnr)
end

-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

--   local opts = { noremap=true, silent=true }

--   -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--   -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--   -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--   -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--   -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
--   -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
--   -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
--   -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

--   -- require "lsp_signature".on_attach({
--   --   bind = true,
--   --   hint_prefix = "🔸",
--   --   max_width = 70,
--   --   extra_trigger_chars = {","},
--   --   handler_opts = {
--   --     border = "shadow"
--   --   }
--   -- })

--   -- vim.lsp.inlay_hint.enable(bufnr)
-- end

-- go development
lsp_config.gopls.setup {
  on_attach = on_attach
}

-- ruby development

lsp_config.rubocop.setup {
  cmd = { "bundle", "exec", "rubocop", "--lsp" }
}

lsp_config.solargraph.setup {
  settings = {
    useBunlder = true,
    solargraph = {
      diagnostics = false,
    }
  }
}

-- vim development
lsp_config.vimls.setup({})

-- nvim development
require("neodev").setup({})

-- lua development
lsp_config.lua_ls.setup({
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
})

-- rust development
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
