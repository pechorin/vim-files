local settings = {
  colorscheme = 'adwaita',
  bg = 'light',

  bundle_file = 'bundle.vim',
  plugins_settings_folder = 'plugins/',
  main_settings_files = {
    '01_general.vim',
    '02_autocommands.vim',
    '03_mappings.vim',
    '04_plugins.vim',
    '04_plugins.lua'
  },
}

if type(Editor) == 'nil' then
  Editor = {
    profile_loads = 0,

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
        vim.opt.bg = 'light'
        vim.cmd.colorscheme(Editor.colorscheme)
      end
    end,

    log_reloading = function(self)
      if self.profile_loads > 1 then
        print("Editor: reloading profile #" .. tostring(self.profile_loads))
      end

      self.profile_loads = self.profile_loads + 1
    end,

    merge_objects = function(o1, o2)
      for k, v in pairs(o2) do
        o1[k] = v
      end
    end
  }

  for k, v in pairs(settings) do
    Editor[k] = v
  end
end

vim.cmd([[
  filetype off
]])

Editor:load_bundle()
Editor:load_settings()
Editor:load_plugins_settings()
Editor:setup_colorscheme()
Editor:log_reloading()

-- function _G.dump(...)
--   local objects = vim.tbl_map(vim.inspect, {...})
--   print(unpack(objects))
-- end
