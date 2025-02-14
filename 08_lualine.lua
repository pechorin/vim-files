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
