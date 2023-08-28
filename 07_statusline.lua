require('lualine').setup({
  options = {
    theme = 'auto',
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 10000,
    }
  },
  sections = {
    lualine_a = {
      { 'mode', fmt = function(str) return str:sub(1,1) end, padding = 1 },
    },
    lualine_b = {'branch', 'diff'},
    lualine_c = {},
    lualine_x = {'fileformat', 'encoding', 'filetype', 'diagnostics'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  winbar = {
    lualine_z = {
      { 'filename', path = 1 }
    }
  },
  tabline = {},
  inactive_winbar = {
    lualine_z = {
      { 'filename', path = 1 }
    }
  },
  extensions = {'quickfix', 'fzf', 'nerdtree', 'neo-tree'}
})
