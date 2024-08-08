function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

---@class Settings
local Settings = {
  colorscheme             = 'default', -- vim colorscheme
  bg                      = 'light',   -- vim background
  vim_plug_bundle_path    = nil, -- vim-plug bundle install path like '~/.vim/bundle/'
  vim_plug_bundle         = {},  -- vim-plug plugins list (flat or grouped list)
  additional_config_files = {}, -- additional .vim / .lua files with custom code
  vim_options             = {}, -- all global vim options (vim.opt.some_option)
  vim_globals             = {}, -- all vim global varitables (vim.g.variable or let g:variable)
  keymaps                 = {}, -- keymaps (flat or grouped list)
  autocommands            = {}, -- autocomamnds (flat or grouped list)
  packs                   = {}, -- packs (pack contain setup() function, autocommands, keymaps) - this is another level of configuration nesting
  show_stats              = false, -- show configuration stats on load
}

---@class PackSettings
local PackSettings = {
  vim_plug_bundle = {}, -- vim-plug plugins list (flat or grouped list)
  keymaps         = {}, -- keymaps (flat or grouped list)
  autocommands    = {}, -- autocomamnds (flat or grouped list)
  setup           = function() end, -- custom setup code for each pack
}

---@class Loader
local Loader = {
  -- all defined user settings
  settings = Settings,

  -- internal stats, contain all defined options
  stats = {
    loads                 = 0,
    options               = 0,
    globals               = 0,
    plugins               = 0,
    plugins_groups        = 0,
    autocommands          = 0,
    autocommands_groups   = 0,
    keymaps               = 0,
    keymaps_groups        = 0,
    global_setup_function = 0,
    packs_setup_functions = 0,
  },

  -- track internal option stat
  stat = function(self, stat)
    self.stats[stat] = self.stats[stat] + 1
  end,

  vim_files_path = function()
    local path = vim.fn.resolve(vim.fn.expand('<sfile>:p'))
    return vim.fn.substitute(vim.fn.substitute(path, ".vimrc", '', ''), 'init.lua', '', '')
  end,

  plugin_managers = {
    plug = {
      install = function()
        local data_dir = vim.fn.stdpath('data') .. '/site'
        local not_installed = vim.fn.glob(data_dir .. '/autoload/plug.vim') == ''

        if not_installed then
          print('installing vim-plug to ' .. data_dir)

          local install_cmd = "silent execute '!curl -fLo " .. data_dir
            .. "/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"

          local autoinstall_plugins_cmd = "autocmd VimEnter * PlugInstall --sync | source $MYVIMRC"

          vim.cmd(install_cmd)
          vim.cmd(autoinstall_plugins_cmd)
        end
      end,

      load_plugin = function(self, plugin_data)
        self:stat('plugins')

        if type(plugin_data) == 'string' then
          vim.fn['plug#'](plugin_data)
        elseif type(plugin_data) == 'table' then
          vim.fn['plug#'](unpack(plugin_data))
        end
      end,

      load_plugins = function(self, list)
        if type(list) ~= 'table' then return end

        for _, plugin_data in ipairs(list) do
          self.plugin_managers.plug.load_plugin(self, plugin_data)
        end
      end,

      unpack_and_load_plugins = function(self, data)
        local plug = self.plugin_managers.plug

        -- regular string plugin definition
        if type(data) == 'string' then
          plug.load_plugin(self, data)

        -- table plugin definition
        elseif type(data) == 'table' then
          if data[1] then
            plug.load_plugin(self, data)
          else
            local iter = pairs(data)
            local _, list = iter(data)

            self:stat('plugins_groups')

            plug.load_plugins(self, list)
          end
        end
      end,

      load = function(self)
        local bundle_path = self.settings.vim_plug_bundle_path
        if type(bundle_path) ~= "string" then return end

        local plug = self.plugin_managers.plug

        plug.install()

        local vim = vim
        vim.o.rtp = vim.o.rtp .. bundle_path ..  '/Vundle.vim'
        vim.call('plug#begin', bundle_path)

        -- load user defined bundle
        if type(self.settings.vim_plug_bundle) == 'table' then
          for _, data in pairs(self.settings.vim_plug_bundle) do
            plug.unpack_and_load_plugins(self, data)
          end
        end

        -- load user defined bundle from packs
        if type(self.settings.packs) == 'table' then
          for _, pack_data in pairs(self.settings.packs) do
            for _, data in pairs(pack_data.vim_plug_bundle) do
              plug.unpack_and_load_plugins(self, data)
            end
          end
        end

        vim.call('plug#end')
      end,
    }
  },

  load_additional_config_files = function(self)
    local opt = self.settings.additional_config_files
    if type(opt) ~= "table" then return end

    for _, setting_file in ipairs(opt) do
      vim.fn.execute('source ' .. self.vim_files_path() .. setting_file)
    end
  end,

  load_colorscheme = function(self)
    local opt = self.settings.colorscheme
    if type(opt) ~= "string" then return end

    -- Set colorscheme once at first profile load
    if self.stats.loads == 0 then
      vim.opt.bg = self.settings.bg or 'light'
      vim.cmd.colorscheme(opt)
    end
  end,

  log_reloading = function(self)
    if self.stats.loads > 1 then
      print("reloading profile #" .. tostring(self.stats.loads))
    end

    self.stats.loads = self.stats.loads + 1
  end,

  show_stats = function(self)
    if self.settings.show_stats == false then return end

    print('profile stats:')
    dump(self.stats)
  end,

  check_health = function(self)
    local problems = {}

    if (self.stats.options == 0) then table.insert(problems, 'vim options not defined') end
    if (self.stats.globals == 0) then table.insert(problems, 'vim globals not set') end
    if (self.stats.plugins == 0) then table.insert(problems, 'no plugins defined') end
    if (self.stats.global_setup_function == 0) then table.insert(problems, 'global setup() function not provided') end

    if #problems > 0 then
      print("NvimConfigLoader not properly set, problems list:")
      dump(problems)
    end
  end,

  get_option_value = function(user_value)
    if type(user_value) == 'function' then
      return user_value()
    else
      return user_value
    end
  end,

  load_vim_options = function(self)
    local opt = self.settings.vim_options
    if type(opt) ~= "table" then return end

    for option, v in pairs(opt) do
      self:stat('options')
      vim.opt[option] = self.get_option_value(v)
    end
  end,

  load_vim_globals = function(self)
    local opt = self.settings.vim_globals
    if type(opt) ~= "table" then return end

    for global, v in pairs(opt) do
      self:stat('globals')
      vim.g[global] = self.get_option_value(v)
    end
  end,

  create_autocommand = function(self, cmd, augroup)
    self:stat('autocommands')

    vim.api.nvim_create_autocmd(cmd.event, {
     pattern  = cmd.pattern,
     group    = augroup,
     command  = cmd.command,
     callback = cmd.callback,
    })
  end,

  create_grouped_autocommands = function(self, group_name, autocommands)
    local augroup = vim.api.nvim_create_augroup(group_name, { clear = true })

    self:stat('autocommands_groups')

    for _, cmd in ipairs(autocommands) do self.create_autocommand(self, cmd, augroup) end
  end,

  unpack_and_create_grouped_autocommands = function(self, key, data)
    if type(data) ~= 'table' then return end

    if type(key) == "number" then
      self.create_autocommand(self, data, nil)
    else
      self.create_grouped_autocommands(self, key, data)
    end
  end,

  load_autocommands = function(self)
    -- load user defined autocommands
    local opt = self.settings.autocommands
    if type(opt) == "table" then
      for key, data in pairs(opt) do
        self:unpack_and_create_grouped_autocommands(key, data)
      end
    end

    -- load user defined autocommands from packs
    if type(self.settings.packs) == 'table' then
      for _, pack_data in pairs(self.settings.packs) do
        if type(pack_data.autocommands) == 'table' then
          for key, data in pairs(pack_data.autocommands) do
            self:unpack_and_create_grouped_autocommands(key, data)
          end
        end
      end
    end
  end,

  unpack_and_load_keymaps = function(self, key, data)
    if type(data) ~= 'table' then return end

    if type(key) == "number" then
      self:stat('keymaps')

      vim.keymap.set(unpack(data))
    else
      self:stat('keymaps_groups')

      for _, mapping in ipairs(data) do
        self:stat('keymaps')

        vim.keymap.set(unpack(mapping))
      end
    end
  end,

  load_keymaps = function(self)
    -- load user defined keymaps
    if type(self.settings.keymaps) == "table" then
      for key, data in pairs(self.settings.keymaps) do
        self.unpack_and_load_keymaps(self, key, data)
      end
    end

    -- load user defined keymaps from packs
    if type(self.settings.packs) == 'table' then
      for _, pack_data in pairs(self.settings.packs) do
        local keymaps = pack_data.keymaps

        if type(keymaps) == 'table' then
          for key, data in pairs(keymaps) do
            self.unpack_and_load_keymaps(self, key, data)
          end
        end
      end
    end
  end,

  setup_packs = function(self)
    if type(self.settings.packs) ~= 'table' then return end

    for _, pack_data in pairs(self.settings.packs) do
      if type(pack_data.setup) == 'function' then
        self:stat('packs_setup_functions')
        pack_data.setup(self)
      end
    end
  end,

  setup = function(self, user_settings)
    -- load settings from main file
    for k, v in pairs(user_settings) do
      if k ~= 'setup' then self.settings[k] = v end
    end

    -- load settings from additional files
    self:load_additional_config_files()

    -- init plugin manager and load plugins
    for _, manager in pairs(self.plugin_managers) do manager.load(self) end

    -- load main vim options
    self:load_vim_options()
    self:load_vim_globals()
    self:load_keymaps()
    self:load_autocommands()
    self:load_colorscheme()

    -- run user main setup() function
    if type(user_settings.setup) == 'function' then
      self:stat('global_setup_function')
      user_settings.setup(self)
    end
    self:setup_packs() -- run packs setup() functions

    -- ...
    self:log_reloading()
    self:show_stats()

    -- ..
    self:check_health()
  end,

  add_pack = function(self, settings)
    if type(settings) ~= 'table' then return end

    for pack_name, pack_settings in pairs(settings) do
      if type(pack_name) == 'string' and type(pack_settings) == 'table' then
        self.settings.packs[pack_name] = pack_settings
      end
    end
  end
}

---@class NvimConfigLoader
local NvimConfigLoader = {
  ---@param settings Settings
  ---setup vim with configuration table
  setup = function(settings)
    Loader:setup(settings)
  end,

  ---@param settings PackSettings
  ---add pack settings to configuration
  add_pack = function(settings)
    Loader:add_pack(settings)
  end,
}

return NvimConfigLoader
