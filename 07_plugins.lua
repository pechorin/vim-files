require('overseer').setup({})
require("fidget").setup({})
require('neotest').setup({ adapters = { require('neotest-rspec'), } })
require('diagflow').setup({ padding_top = 5, text_align = 'left' })
require("scrollbar").setup()

require('mini.surround').setup({})
require('mini.ai').setup({})
require('mini.cursorword').setup({})

require("snippets").setup({
  create_cmp_source = true,
  friendly_snippets = true
})

require("nvim-autopairs").setup({
  check_ts = true
})

require('eyeliner').setup({
  highlight_on_key = true, -- show highlights only after keypress
  dim = false              -- dim all other characters if set to true (recommended!)
})

require('gitsigns').setup({
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true, virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000, ignore_whitespace = false, virt_text_priority = 100,
  },
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

require("which-key").setup({
  preset = 'helix',
  triggers = {
    { "<auto>", mode = "nixsotc" },
    { "a", mode = { "n", "v" } },
  },
})

-- require('symbol-usage').setup()

require('tiny-glimmer').setup({
  paste = { enable = true },
  undo  = { enable = true },
  redo  = { enable = true },
  support = {
    substitute = { enabled = false }
  },
})
