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

-- ~ ray-x/go.nvim
--
-- Example:
--   goimport='goimports', -- goimport command
--   gofmt = 'gofmt', --gofmt cmd,
--   max_line_len = 120, -- max line length in goline format
--   tag_transform = false, -- tag_transfer  check gomodifytags for details
--   test_template = '', -- default to testify if not set; g:go_nvim_tests_template  check gotests for details
--   test_template_dir = '', -- default to nil if not set; g:go_nvim_tests_template_dir  check gotests for details
--   comment_placeholder = '' ,  -- comment_placeholder your cool placeholder
--   verbose = false,  -- output loginf in messages
--   lsp_cfg = true, -- true: apply go.nvim non-default gopls setup
--   lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
--   lsp_on_attach = true, -- if a on_attach function provided:  attach on_attach function to gopls
--                         -- true: will use go.nvim on_attach if true
--                         -- nil/false do nothing
--   gopls_cmd = nil,
--   lsp_diag_hdlr = false, -- hook lsp diag handler
--   dap_debug = false, -- set to true to enable dap
--   dap_debug_keymap = true, -- set keymaps for debugger
--   dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
--   dap_debug_vt = true, -- set to true to enable dap virtual text
require('go').setup({
  goimport = 'gopls', -- if set to 'gopls' will use golsp format
  gofmt = 'gopls', -- if set to gopls will use golsp format
  lsp_cfg = false,
  lsp_on_attach = true,
})

-- hover events
require("hover").setup {
    init = function()
        -- Require providers
        require("hover.providers.lsp")
        -- require('hover.providers.gh')
        -- require('hover.providers.gh_user')
        -- require('hover.providers.jira')
        -- require('hover.providers.man')
        -- require('hover.providers.dictionary')
    end,
    preview_opts = {
        -- border = 'none'
        -- border = 'shadow'
        border = 'solid'
    },
    -- Whether the contents of a currently open hover window should be moved
    -- to a :h preview-window when pressing the hover keymap.
    preview_window = false,
    title = false,
    mouse_providers = {
        'LSP'
    },
    mouse_delay = 1000
}

-- Setup hover keymaps
vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
vim.keymap.set("n", "<C-p>", function() require("hover").hover_switch("previous") end, {desc = "hover.nvim (previous source)"})
vim.keymap.set("n", "<C-n>", function() require("hover").hover_switch("next") end, {desc = "hover.nvim (next source)"})

-- Mouse hover support
vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = "hover.nvim (mouse)" })
vim.o.mousemoveevent = true
