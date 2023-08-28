-- ~ which key
require("which-key").setup({})

-- ~ tree-sitter
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "c", "cpp", "lua", "bash", "ruby",
    "go", "rust", "css", "html", "javascript",
    "json", "regex", "typescript", "vue", "python",
    "embedded_template", "sql"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
  }
}

-- ~ neo-tree
require("neo-tree").setup({
  enable_git_status = true,
  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 0,
    },
    icon = {
      folder_closed = ">",
      folder_open = "-",
      folder_empty = "ﰊ",
    },
    modified = {
      symbol = "[+]"
    }
  },
  window = {
    width = 25
  },
  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        "node_modules",
        "tags",
      },
      never_show = {
        ".DS_Store"
      }
    },
    follow_current_file = true,
    use_libuv_file_watcher = true,
  }
})

-- ~ ray-x/go.nvim
-- require('go').setup({
  -- goimport = 'gopls', -- if set to 'gopls' will use golsp format
  -- gofmt = 'gopls', -- if set to gopls will use golsp format
  -- lsp_cfg = false,
  -- lsp_on_attach = true,
-- })

-- format on save
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').gofmt()
  end,
  group = format_sync_grp,
})

-- Autopairs
-- require("nvim-autopairs").setup({})

-- Surroundings
require("nvim-surround").setup({})

-- Neotest
require('neotest').setup({
  adapters = {
    require('neotest-rspec'),
  }
})

-- Eyeliner
require('eyeliner').setup({
  highlight_on_key = true, -- show highlights only after keypress
  dim = false              -- dim all other characters if set to true (recommended!)
})

-- Overseer
require('overseer').setup()

-- nvim-lint
require('lint').linters_by_ft = {
  -- markdown = {'vale',}
  ruby = {'rubocop',}
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = {"*.rb", "*.erb", "*.haml", "*.slim"},
  callback = function()
    require("lint").try_lint()
  end,
})

vim.api.nvim_create_autocmd({ "BufRead" }, {
  pattern = {"*.rb", "*.erb", "*.haml", "*.slim"},
  callback = function()
    require("lint").try_lint()
  end,
})

-- require('diagflow').setup({
--   padding_top = 5,
--   text_align = 'left'
-- })

vim.diagnostic.config({ virtual_text = true, underline = false, signs = true })
