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

-- tabs
require('tabline').setup({
    no_name = '[No Name]',    -- Name for buffers with no name
    modified_icon = '',      -- Icon for showing modified buffer
    close_icon = '',         -- Icon for closing tab with mouse
    separator = "▌",          -- Separator icon on the left side
    padding = 3,              -- Prefix and suffix space
    color_all_icons = false,  -- Color devicons in active and inactive tabs
    right_separator = false,  -- Show right separator on the last tab
    show_index = false,       -- Shows the index of tab before filename
    show_icon = true,         -- Shows the devicon
})
