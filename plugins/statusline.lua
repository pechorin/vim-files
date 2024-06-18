local dropbar = require('dropbar')

dropbar.setup({})

require('lualine').setup({
  options = {
    theme = 'auto',
    globalstatus = true,
    refresh = {
      statusline = 3000,
      tabline = 3000,
      winbar = 3000,
    },
    section_separators = '', component_separators = '',
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    disabled_filetypes = {
      winbar = { 'nerdtree', 'neo-tree' , 'alpha', 'fugitive', '', 'esearch'},
    },
  },
  sections = {
    lualine_a = {
      { 'mode', fmt = function(str) return str:sub(1,1) end, padding = 1 },
    },
    lualine_b = {'branch', 'diff'},
    lualine_c = {},
    lualine_x = {
      { 'filename', path = 1, newfile_status = true },
      'fileformat',
      'encoding',
      'filetype',
      'diagnostics'
    },
    lualine_y = {'progress'},
    lualine_z = {'location', 'searchcount', 'selectioncount' }
  },
  -- tabline = {
  --   lualine_a = {
  --     {
  --       'tabs',
  --       mode = 2,
  --       path = 1,
  --       use_mode_colors = true
  --     }
  --   },
  --   -- lualine_b = {
  --   --   { 'buffers' }
  --   -- },
  -- },
  winbar = {
    lualine_a = { '%{%v:lua.dropbar.get_dropbar_str()%}' },
    lualine_z = {
    --   { 'filename', path = 1, newfile_status = true }
    }
  },
  inactive_winbar = {
    lualine_a = { '%{%v:lua.dropbar.get_dropbar_str()%}' },
    lualine_z = {
      { 'filename', path = 1, newfile_status = true }
    }
  },
  extensions = {'quickfix', 'fzf', 'nerdtree', 'neo-tree', 'fugitive', 'man', 'trouble'}
})
