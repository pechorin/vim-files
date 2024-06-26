-- TODO: lazy.nvim/vim-pack integration ?
--
-- TODO: add vimplug autodonwload & setup
--
-- TODO: add cool checkhealth with main settings detection

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

local NvimConfigLoader = {
  profile_loads        = 0,
  default_presets      = {},
  packs                = {},

  colorscheme          = 'default',
  bg                   = 'light',

  -- Vim plug bundle path
  vim_plug_bundle_path = nil,

  -- Additional .vim or .lua config sources from ~/.vim/ like:
  --  completion.lua
  --  lsp.lua
  additional_config_files = {},

  vim_options          = {},
  vim_globals          = {},

  vim_plug_bundle      = {},

  keymaps              = {},
  autocommands         = {},

  -- TODO: default presets
  use_lint             = {},
  use_treesitter       = {},
  start_dashboard      = {},


  vim_files_path = function()
    local path = vim.fn.resolve(vim.fn.expand('<sfile>:p'))
    return vim.fn.substitute(vim.fn.substitute(path, ".vimrc", '', ''), 'init.lua', '', '')
  end,

  load_vim_plug_bundle = function(self)
    local bundle_path = self.vim_plug_bundle_path
    local bundle      = self.vim_plug_bundle

    if type(bundle_path) ~= "string" then return end
    if type(bundle)      ~= "table"  then return end

    vim.o.rtp = vim.o.rtp .. bundle_path ..  '/Vundle.vim'

    local vim  = vim
    local Plug = vim.fn['plug#']

    vim.call('plug#begin', bundle_path)

    local load_plugin = function(data)
      if type(data) == 'string' then
        Plug(data)
      elseif type(data) == 'table' then
        Plug(unpack(data))
      end
    end

    -- load presets bundle
    if type(self.default_presets) == 'table' then
      for _, preset in pairs(self.default_presets) do
        if type(preset.vim_plug_bundle) == 'table' then
          for _, plugin_data in ipairs(preset.vim_plug_bundle) do
            load_plugin(plugin_data)
          end
        end
      end
    end

    -- load user defined bundle
    for _, group_bundle in ipairs(bundle) do
      local plugins = group_bundle.plugins or {}

      for _, plugin_data in ipairs(plugins) do
        load_plugin(plugin_data)
      end
    end

    -- TODO: load user defined bundle from packs

    vim.call('plug#end')
  end,

  load_additional_config_files = function(self)
    local opt = self.additional_config_files
    if type(opt) ~= "table" then return end

    for _, setting_file in ipairs(opt) do
      vim.fn.execute('source ' .. self.vim_files_path() .. setting_file)
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
      print("NvimConfigLoader: reloading profile #" .. tostring(self.profile_loads))
    end

    self.profile_loads = self.profile_loads + 1
  end,

  load_vim_options = function(self)
    local opt = self.vim_options
    if type(opt) ~= "table" then return end

    for option, v in pairs(opt) do
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
    local opt = self.vim_globals
    if type(opt) ~= "table" then return end

    for global, v in pairs(opt) do
      local value

      if type(v) == 'function' then
        value = v()
      else
        value = v
      end

      vim.g[global] = value
    end
  end,

  load_autocommands = function(self)
    local create_autocmd = function(cmd, augroup)
      vim.api.nvim_create_autocmd(cmd.event, {
       pattern  = cmd.pattern,
       group    = augroup,
       command  = cmd.command,
       callback = cmd.callback,
      })
    end

    -- load presets bundle
    if type(self.presets) == 'table' then
      for group, preset in pairs(self.presets) do
        local augroup = vim.api.nvim_create_augroup(group, { clear = true })

        if type(preset.autocommands) == 'table' then
          for _, cmd in ipairs(preset.autocommands) do create_autocmd(cmd, augroup) end
        end
      end
    end

    -- load user defined autocommands
    local opt = self.autocommands
    if type(opt) ~= "table" then return end

    for group, commands in pairs(opt) do
      local augroup = vim.api.nvim_create_augroup(group, { clear = true })

      for _, cmd in ipairs(commands) do create_autocmd(cmd, augroup) end
    end

    -- TODO: load user defined autocommands from packs
  end,

  load_keymaps = function(self)
    local opt = self.keymaps
    if type(opt) ~= "table" then return end

    for _, group in pairs(opt) do
      for _, mapping in ipairs(group) do vim.keymap.set(unpack(mapping)) end
    end
  end,

  load_default_presets = function(self)
    if type(self.default_presets) ~= 'table' then return end

    -- load presets bundle
    for name, preset in pairs(self.default_presets) do
      if type(preset.setup) == 'function' then
        preset.setup(self)
      end
    end
  end,

  load_packs = function(self)
    if type(self.packs) ~= 'table' then return end

    -- TODO:
  end,

  setup = function(self, config)
    for k, v in pairs(config) do
      if k ~= 'setup' then self[k] = v end
    end

    self:load_vim_plug_bundle()
    self:load_vim_options()
    self:load_vim_globals()

    self:load_default_presets()

    self:load_additional_config_files()

    if type(config.setup) == 'function' then config.setup(self) end

    self:load_keymaps()
    self:load_autocommands()
    self:setup_colorscheme()
    self:log_reloading()
  end
}

local DefaultPresets = {
  nvim_lint = {
    vim_plug_bundle = {
      'mfussenegger/nvim-lint' -- " TODO: use lsp linter support?
    },
    setup = function(self)
      if type(self.use_lint) == 'table' then
        if type(self.use_lint.linters_by_ft) == 'table' then
          require('lint').linters_by_ft = self.use_lint.linters_by_ft

          local pattern = self.use_lint.file_pattern or { "*.rb", "*.erb", "*.haml", "*.slim" }

          vim.api.nvim_create_autocmd({ "BufWritePost", "BufRead" }, {
            pattern = pattern,
            callback = function()
              require("lint").try_lint()
            end,
          })
        end
      end
    end,
  },
  nvim_treesitter = {
    vim_plug_bundle = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-treesitter/playground',
      'SmiteshP/nvim-gps'
    },
    setup = function(self)
      if type(self.use_treesitter) ~= 'table' or type(self.use_treesitter.languages) ~= 'table' then return end

      require('nvim-treesitter.configs').setup {
        ensure_installed = self.use_treesitter.languages,
        sync_install     = true,
        auto_install     = true,
        highlight        = { enable = true }
      }
    end
  },
  alpha_start_dashboard = {
    vim_plug_bundle = {
      'goolord/alpha-nvim'
    },
    autocommands = {
      -- Disable folding on alpha buffer
      { event = { 'FileType' }, pattern = 'alpha', command = 'setlocal nofoldenable' },
    },
    setup = function(self)
      local alpha = require("alpha")
      local startify = require("alpha.themes.startify")

      local title = self.start_dashboard.title or 'Hello world'

      startify.section.header.val = { '[[> ' .. title  .. ' ]]' }

      startify.opts.layout[1].val = 2
      startify.opts.opts.margin   = 3

      -- disable MRU
      startify.section.mru.val = { { type = "padding", val = 0 } }

      local buttons = {}

      for _, data in pairs(self.start_dashboard.buttons or {}) do
        local btn = startify.button(unpack(data))
        table.insert(buttons, btn)
      end

      startify.section.top_buttons.val = buttons

      -- Send config to alpha
      alpha.setup(startify.config)
    end
  }
}

NvimConfigLoader.default_presets = DefaultPresets

return NvimConfigLoader
