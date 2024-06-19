Config = {
  colorscheme = 'adwaita',
  bg          = 'light',

  bundle_file             = 'bundle.vim',
  plugins_settings_folder = 'plugins/',

  main_settings_files = {
    'autocommands.vim',
    'mappings.vim',
    'plugins.vim',
    'plugins.lua'
  },

  use_rg = true,
  zsh    = true,

  -- TODO:
  lsp_languages = {
    'ruby', 'go', 'lua', 'viml'
  },

  -- TODO:
  tree_sitter_languages = {},

  vim_options = {
    wildoptions    = 'pum',
    pumblend       = 0,
    completeopt    = 'menu,menuone,noselect',
    mouse          = 'a',
    -- floatblend     = 8,

    inccommand     = 'nosplit',
    showmode       = true, -- always show what mode we're currently editing in
    termguicolors  = true,
    complete       = '.,w,b,u,t,i', -- set completion options
    omnifunc       = 'syntaxcomplete#Complete',
    updatetime     = 200,
    encoding       = 'utf-8',
    fileencodings  = 'utf-8,cp1251',
    -- t_Co           = '256', -- Explicitly tell Vim that the terminal supports 256 colors

    wildmenu       = true, -- display command-line autocomplete variants
    wildmode       = 'full',
    wildignore     = function() return vim.opt.wildignore + '.hg,.git,.svn,*.DS_Store,*.pyc' end,
    title          = true, -- change the terminal's title

    visualbell     = true, -- Use visual bell instead of beeping
    -- scrolloff      = 15, -- makes vim centered like a iA Writer
    showtabline    = 1, -- display tabline only if where is more then one tab

    linebreak      = true,
    -- showbreak      = vim.fn.nr2char(8618) .. ' ',
    showbreak      = '>> ',
    autoindent     = true, -- always set autoindenting on
    expandtab      = true,
    shiftwidth     = 2,
    tabstop        = 2,
    softtabstop    = 2,
    cursorline     = true,
    splitbelow     = true,
    splitright     = true,
    mousehide      = true, -- Hide the mouse when typing text
    laststatus     = 2,

    hidden         = true, -- this allows to edit several files in the same time without having to save them

    incsearch      = true, -- show search matches as you type
    ignorecase     = true, -- ignore case when searching
    smartcase      = true,
    showmatch      = true, -- set show matching parenthesis
    gdefault       = true, -- all matches in a line are substituted instead of one.

    history        = 1000, -- store lots of :cmdline history
    undolevels     = 1000, --  use many muchos levels of undo
    timeoutlen     = 250,
  },

  -- TODO:
  vim_globals = {
    NERDTreeShowHidden = 1,
    NERDTreeMinimalUI  = 1, -- Disables display of the 'Bookmarks' label and 'Press ? for help' text.
    NERDTreeDirArrows  = 0, -- Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.
    NERDTreeIgnore     = { '.git$' },
    NERDTreeStatusline = 0,
    NERDTreeWinSize    = 25,

    -- javascript-libraries-syntax.vim
    used_javascript_libs = 'underscore, backbone, angularjs',

    -- markdown
    vim_markdown_folding_disabled = 1,

    -- vim-test
    ['test#strategy']             = 'neovim',
    ['test#neovim#term_position'] = 'rightbelow 25',
    ['test#preserve_screen']      = 1,
    ['test#neovim#start_normal']  = 1,
    ['test#ruby#rspec#options']   = { file = '--format documentation' },

    -- ~ ruby
    ruby_path             = function() return vim.fn.system('rbenv prefix') end,
    ruby_host_prog        = function() return vim.fn.substitute(vim.fn.system('rbenv prefix') .. '/bin/ruby', "\n", '', 'g') end,
    ruby_operators        = 1,
    ruby_pseudo_operators = 1,
    ruby_no_expensive     = 1,

    -- esearch
    esearch             = {},
    ['esearch.win_map'] = {
      {'n', 'gq',  ':call esearch#init(extend(copy(b:esearch), {"out": "qflist"}))<cr>'  },
      {'n', 'gsp', ':call esearch#init(extend(b:esearch, sort_by_path))<cr>'             },
      {'n', 'gsd', ':call esearch#init(extend(b:esearch, sort_by_date))<cr>'             },
    },

    -- Set the initial pattern content using the highlighted '/' pattern (if
    -- v:hlsearch is true), the last searched pattern or the clipboard content.
    ['esearch.prefill'] = {'last', 'clipboard'},
    ['esearch.live_update'] = true,
    ['esearch.win_new'] = { esearch = "esearch#buf#goto_or_open(esearch.name, 'new')" }, -- TODO: recheck

    -- Helpers to use in keymaps.
    ['sort_by_path'] = {adapters = {rg = {options = '--sort path'}}},
    ['sort_by_date'] = {adapters = {rg = {options = '--sort modified'}}},
    -- NOTE: {'backend': 'system'} means synchronous reload using system() call to stay within the same context
    -- ['AddAfter'] = { n = { after = b:esearch.after + n, 'backend': 'system'}}, -- TODO: recheck

    -- any-jump.vim config
    any_jump_search_prefered_engine = 'rg',
    any_jump_ignored_files          = {'*.tmp', '*.temp', 'tags'},

    -- ctags
    gutentags_define_advanced_commands = 1,
    gutentags_ctags_exclude            = {'*.js', '*.jsx', '*.coffee', '*.js.erb', 'node_modules'},
    gutentags_file_list_command = 'rg --files',

    -- hi MsgSeparator guifg=#ff00ff

    -- vim-table-mode
    table_mode_corner='|',

    -- onedark theme config
    onedark_config = { style = 'warmer' },

    -- nvim-cursorword
    -- hi default CursorWord cterm=underline gui=underline
    -- hi default CursorWord cterm=underline guifg=#ff00ff

    -- minimap
    minimap_git_colors = true,

    -- winresize
    winresizer_vert_resize = 25,
    winresizer_horiz_resize = 5,
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
        no_name         = '[new]',
        modified_icon   = '',
        close_icon      = '',
        -- separator    = "▌",
        separator       = "|",
        padding         = 1,
        color_all_icons = true,
        right_separator = true,
        show_index      = false,
        show_icon       = true,
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

    -- Dropbar
    vim.ui.select = require('dropbar.utils.menu').select
  end
}

-- Global helpers
function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

-- Editor instance
-- if type(Editor) == 'nil' then
  Editor = {
    colorscheme             = 'default',
    bg                      = 'light',
    bundle_file             = 'bundle.vim',
    plugins_settings_folder = 'plugins/',
    main_settings_files     = {},
    profile_loads           = 0,

    vim_options             = {},
    vim_globals             = {},
    use_rg                  = false,
    use_zsh                 = false,

    vim_files_path = function()
      local path = vim.fn.resolve(vim.fn.expand('<sfile>:p'))
      return vim.fn.substitute(vim.fn.substitute(path, ".vimrc", '', ''), 'init.lua', '', '')
    end,

    plugins_path = function(self)
      return self.vim_files_path() .. self.plugins_settings_folder
    end,

    before_setup = function(self)
      vim.cmd [[
        filetype off
      ]]
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

      -- do not hl cursor in term
      vim.cmd [[
        hi CursorLine cterm=NONE
      ]]
    end,

    log_reloading = function(self)
      if self.profile_loads > 1 then
        print("Editor: reloading profile #" .. tostring(self.profile_loads))
      end

      self.profile_loads = self.profile_loads + 1
    end,

    load_vim_options = function(self)
      for option, v in pairs(self.vim_options) do
        local value

        if type(v) == 'function' then
          value = v()
        else
          value = v
        end

        vim.opt[option] = value
      end
    end,

    load_vim_globals = function(self)
      for global, v in pairs(self.vim_globals) do
        local value

        if type(v) == 'function' then
          value = v()
        else
          value = v
        end

        vim.g[global] = value
      end
    end,

    setup_rg = function(self)
      if (self.use_rg) then
        vim.opt.grepprg = 'rg --color=never'
      end
    end,

    setup_zsh = function(self)
      if (self.use_zsh and vim.fn.executable('/bin/zsh')) then
        vim.opt.shell = 'bin/zsh -l'
      end
    end,

    setup = function(self, config)
      for k, v in pairs(config) do
        self[k] = v
      end

      self:before_setup()
      self:load_bundle()
      self:load_settings()
      self:load_vim_options()
      self:load_vim_globals()
      self:setup_rg()
      self:setup_zsh()
      self:load_plugins_settings()
      self:setup_colorscheme()
      self:log_reloading()
    end
  }
-- end

-- Setup Editor with config
Editor:setup(Config)
