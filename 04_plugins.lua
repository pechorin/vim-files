require("which-key").setup({})

require("nvim-autopairs").setup({})

require("nvim-surround").setup({})

require('neotest').setup({
  adapters = {
    require('neotest-rspec'),
  }
})

require('eyeliner').setup({
  highlight_on_key = true, -- show highlights only after keypress
  dim = false              -- dim all other characters if set to true (recommended!)
})

require('overseer').setup()

-- require('diagflow').setup({
--   padding_top = 5,
--   text_align = 'left'
-- })

require("scope").setup({})

require("yanky").setup({})

require("fidget").setup({})

require("search").setup({
  -- TODO: setup https://github.com/FabianWirth/search.nvim
})

require("trouble").setup({})

-- git markers
require('gitsigns').setup({
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
})

-- tabline
require('tabline').setup({
    no_name = '[new]',    -- Name for buffers with no name
    modified_icon = '',      -- Icon for showing modified buffer
    close_icon = '',         -- Icon for closing tab with mouse
    -- separator = "▌",          -- Separator icon on the left side
    separator = "|",          -- Separator icon on the left side
    padding = 1,              -- Prefix and suffix space
    color_all_icons = true,  -- Color devicons in active and inactive tabs
    right_separator = true,  -- Show right separator on the last tab
    show_index = false,       -- Shows the index of tab before filename
    show_icon = true,         -- Shows the devicon
})

-- tabout
require('tabout').setup({
  tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
  backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
  act_as_tab = true, -- shift content if tab out is not possible
  act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
  default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
  default_shift_tab = '<C-d>', -- reverse shift default action,
  enable_backwards = true, -- well ...
  completion = true, -- if the tabkey is used in a completion pum
  tabouts = {
    {open = "'", close = "'"},
    {open = '"', close = '"'},
    {open = '`', close = '`'},
    {open = '(', close = ')'},
    {open = '[', close = ']'},
    {open = '{', close = '}'}
  },
  ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
  exclude = {} -- tabout will ignore these filetypes
})
