-- ~ which key
-- require("which-key").setup({})

-- ~ tree-sitter
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
    width = 30
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
    follow_current_file = { enable = false },
    use_libuv_file_watcher = true,
  },
  source_selector = { winbar = true },
  sources = { "filesystem", "buffers", "git_status" }
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

require("scope").setup({})

require("yanky").setup({})

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

require("fidget").setup({})

require("search").setup({
  -- TODO: setup https://github.com/FabianWirth/search.nvim
})

-- tabline
-- TODO


-- Hover
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

-- Setup keymaps
vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
vim.keymap.set("n", "<C-p>", function() require("hover").hover_switch("previous") end, {desc = "hover.nvim (previous source)"})
vim.keymap.set("n", "<C-n>", function() require("hover").hover_switch("next") end, {desc = "hover.nvim (next source)"})

-- Mouse support
vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = "hover.nvim (mouse)" })
vim.o.mousemoveevent = true
