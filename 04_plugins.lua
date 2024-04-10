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

require('gitsigns').setup()

require('leap')

vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')
