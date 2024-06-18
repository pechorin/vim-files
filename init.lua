local config = {
  colorscheme = 'adwaita',
  bg          = 'light',

  bundle_file             = 'bundle.vim',
  plugins_settings_folder = 'plugins/',

  main_settings_files = {
    '01_general.vim',
    '02_autocommands.vim',
    '03_mappings.vim',
    '04_plugins.vim',
    '04_plugins.lua'
  },

  -- TODO:

  use_rg = true,
  zsh    = true,

  lsp_languages = {
    'ruby', 'go', 'lua', 'viml'
  },

  tree_sitter_languages = {},

  vim_options = {
    wildoptions = 'pum',
    pumblend = 0,
    inccommand = 'nosplit'
  },

  vim_global_settings = {
    NERDTreeShowHidden  = 1,

    ['g:test#strategy'] = 'neovim',

    ruby_path = function()
      return vim.fn.system('rbenv prefix')
    end,
  },

  setup = function()
    require("which-key").setup({})
    require("nvim-autopairs").setup({})
    require("nvim-surround").setup({})
    require('overseer').setup({})
    require("scope").setup({})
    require("yanky").setup({})
    require("fidget").setup({})
    require("trouble").setup({})
    require("search").setup({})
    require('neotest').setup({ adapters = { require('neotest-rspec'), } })
    require('diagflow').setup({ padding_top = 5, text_align = 'left' })

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

    -- Dropbar
    vim.ui.select = require('dropbar.utils.menu').select
  end
}

if type(Editor) == 'nil' then
  Editor = {
    colorscheme             = 'default',
    bg                      = 'light',
    bundle_file             = 'bundle.vim',
    plugins_settings_folder = 'plugins/',
    main_settings_files     = {},
    profile_loads           = 0,

    vim_files_path = function()
      local path = vim.fn.resolve(vim.fn.expand('<sfile>:p'))
      return vim.fn.substitute(vim.fn.substitute(path, ".vimrc", '', ''), 'init.lua', '', '')
    end,

    plugins_path = function(self)
      return self.vim_files_path() .. self.plugins_settings_folder
    end,

    load_bundle = function(self)
      vim.fn.execute('source ' .. self.vim_files_path() .. self.bundle_file)
    end,

    load_settings = function(self)
      for _, setting_file in ipairs(self.main_settings_files) do
        vim.fn.execute('source ' .. self.vim_files_path() .. setting_file)
      end
    end,

    load_plugins_settings = function(self)
      local plugins_entries = vim.fn.readdir(self:plugins_path(), [[ v:val =~ '\.lua$' || v:val =~ '\.vim' ]])

      for _, file in ipairs(plugins_entries) do
        local plugin_path = self:plugins_path() .. file
        vim.fn.execute('source ' .. plugin_path)
      end
    end,

    setup_colorscheme = function(self)
      -- Set colorscheme once at first profile load
      if self.profile_loads == 0 then
        vim.opt.bg = self.bg
        vim.cmd.colorscheme(self.colorscheme)
      end
    end,

    log_reloading = function(self)
      if self.profile_loads > 1 then
        print("Editor: reloading profile #" .. tostring(self.profile_loads))
      end

      self.profile_loads = self.profile_loads + 1
    end,

    setup = function(self, config)
      for k, v in pairs(config) do
        self[k] = v
      end

      self:load_bundle()
      self:load_settings()
      self:load_plugins_settings()
      self:setup_colorscheme()
      self:log_reloading()
    end
  }
end

vim.cmd([[
  filetype off
]])

Editor:setup(config)

-- function _G.dump(...)
--   local objects = vim.tbl_map(vim.inspect, {...})
--   print(unpack(objects))
-- end
