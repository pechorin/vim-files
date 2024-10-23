require("which-key").setup({})
require("nvim-autopairs").setup({})
require("nvim-surround").setup({})
require('overseer').setup({})
require("scope").setup({})
require("yanky").setup({})
require("fidget").setup({})
require('neotest').setup({ adapters = { require('neotest-rspec'), } })
require('diagflow').setup({ padding_top = 5, text_align = 'left' })
require("scrollbar").setup()

-- snippets
require("snippets").setup({
  create_cmp_source = true,
  friendly_snippets = true
})

-- neo-tree
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

require('eyeliner').setup({
  highlight_on_key = true, -- show highlights only after keypress
  dim = false              -- dim all other characters if set to true (recommended!)
})

-- git markers
require('gitsigns').setup({
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true, virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000, ignore_whitespace = false, virt_text_priority = 100,
  },
})

-- tabline
require('tabby').setup({
  preset = 'tab_only',
})

-- tabout
require('tabout').setup({
  tabkey            = '<Tab>', -- key to trigger tabout, set to an empty string to disable
  backwards_tabkey  = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
  act_as_tab        = true, -- shift content if tab out is not possible
  act_as_shift_tab  = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
  default_tab       = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
  default_shift_tab = '<C-d>', -- reverse shift default action,
  enable_backwards  = true, -- well ...
  completion        = true, -- if the tabkey is used in a completion pum
  tabouts = {
    {open = "'", close = "'"},
    {open = '"', close = '"'},
    {open = '`', close = '`'},
    {open = '(', close = ')'},
    {open = '[', close = ']'},
    {open = '{', close = '}'}
  },
  ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
  exclude          = {} -- tabout will ignore these filetypes
})

-- lualine
local gps = require("nvim-gps")
gps.setup()

local treesitter = require('nvim-treesitter')

-- local current_treesitter_context = function()
--   if not packer_plugins["nvim-treesitter"] or packer_plugins["nvim-treesitter"].loaded == false then
--     return " "
--   end
--   local f = require'nvim-treesitter'.statusline({
--     indicator_size = 300,
--     type_patterns = {"class", "function", "method", "interface", "type_spec", "table", "if_statement", "for_statement", "for_in_statement"}
--   })
--   local fun_name = string.format("%s", f) -- convert to string, it may be a empty ts node

--   -- print(string.find(fun_name, "vim.NIL"))
--   if fun_name == "vim.NIL" then
--     return " "
--   end
--   return " " .. fun_name
-- end

require('lualine').setup({
  options = {
    theme              = 'auto',
    globalstatus       = true,
    refresh            = { statusline = 3000, tabline = 3000, winba = 3000 },
    section_separators = '', component_separators = '',
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    disabled_filetypes = { winbar = { 'nerdtree', 'neo-tree' , 'alpha', 'fugitive', '', 'esearch'} },
  },
  sections = {
    lualine_a = {
      { 'mode', fmt = function(str) return str:sub(1,1) end, padding = 1 },
    },
    lualine_b = {'branch', 'diff'},
    lualine_c = {
      { treesitter.statusline }
    },
    lualine_x = {
      -- { 'filename', path = 1, newfile_status = true },
      'fileformat', 'encoding', 'filetype', 'diagnostics',
    },
    lualine_y = {'progress'},
    lualine_z = {'location', 'searchcount', 'selectioncount'},
  },
  -- tabline = {
  --   lualine_a = {
  --     {
  --       'tabs',
  --       mode = 1,
  --       path = 1,
  --       use_mode_colors = true
  --     }
  --   },
  --   -- lualine_b = {
  --   --   { 'buffers' }
  --   -- },
  -- },
  winbar = {
    lualine_a = {
      {
        'navic',
        color_correction = 'dynamic',
        navic_opts = {
          highlight = true,
          click = true,
          separator = '  '
        }
      },
    },
    lualine_z = {
      { 'filename', path = 1, newfile_status = true },
    }
  },
  inactive_winbar = {
    lualine_z = {
      { 'filename', path = 1, newfile_status = true }
    }
  },
  extensions = {'quickfix', 'fzf', 'nerdtree', 'neo-tree', 'fugitive', 'man', 'trouble'}
})

-- quickfix
vim.cmd [[
  packadd cfilter
]]

-- do not hl cursor in term
vim.cmd [[
  hi CursorLine cterm=NONE
]]

-- zsh
vim.opt.shell = '/bin/zsh -l'

-- fzf
vim.cmd [[
  set rtp+=/usr/local/opt/fzf
]]

-- ripgrep
vim.opt.grepprg = 'rg --color=never'

-- Grug-far search
require('grug-far').setup({
  -- there are no required options atm
  -- engine = 'ripgrep' is default, but 'astgrep' can be specified
})
