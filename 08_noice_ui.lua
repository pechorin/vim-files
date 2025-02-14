-- noice.nvim
require("noice").setup({
  -- lsp = {
  --   -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --   override = {
  --     ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --     ["vim.lsp.util.stylize_markdown"] = true,
  --     ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
  --   },
  -- },
  -- you can enable a preset for easier configuration
  cmdline = {
    enabled = true
  },
  popupmenu = {
    enabled = true
  },
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
  messages = {
    enabled = false
  },
  notify = {
    enabled = false
  },
  lsp = {
    progress = {
      enabled = false
    },
    hover = {
      enabled = false
    },
    signature = {
      enabled = false
    },
    messages = {
      enabled = false
    },
    documentation = {
      enabled = false
    }
  },
  views = {
    cmdline_popup = {
      border = {
        style = "none",
        padding = { 1, 1 },
      },
      filter_options = {},
      win_options = {
        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      },
    },
  }
})
