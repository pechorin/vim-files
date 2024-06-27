-- TODO: lazy.nvim integration ?
-- TODO: add before|after_setup ?

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

TinyNvimLoader = {
  profile_loads        = 0,

  colorscheme          = 'default',
  bg                   = 'light',

  vim_plug_bundle_path = nil,
  main_settings_files  = {},

  use_rg               = false,
  use_zsh              = false,
  use_fzf              = false,
  use_lint             = {},
  use_treesitter       = {},

  start_dashboard      = {},
  keymaps              = {},
  autocommands         = {},
  vim_plug_bundle      = {},

  vim_options          = {},
  vim_globals          = {},

  vim_files_path = function()
    local path = vim.fn.resolve(vim.fn.expand('<sfile>:p'))
    return vim.fn.substitute(vim.fn.substitute(path, ".vimrc", '', ''), 'init.lua', '', '')
  end,

  load_vim_plug_bundle = function(self)
    vim.o.rtp = vim.o.rtp .. self.vim_plug_bundle_path ..  '/Vundle.vim'

    local vim  = vim
    local Plug = vim.fn['plug#']

    vim.call('plug#begin', self.vim_plug_bundle_path)

    for _, group_bundle in ipairs(self.vim_plug_bundle or {}) do
      local plugins = group_bundle.plugins or {}

      for _, plugin_data in ipairs(plugins) do
        if type(plugin_data) == "string" then
          Plug(plugin_data)
        elseif type(plugin_data) == 'table' then
          Plug(unpack(plugin_data))
        end
      end
    end

    vim.call('plug#end')
  end,

  load_settings_files = function(self)
    for _, setting_file in ipairs(self.main_settings_files) do
      vim.fn.execute('source ' .. self.vim_files_path() .. setting_file)
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
      print("TinyNvimLoader: reloading profile #" .. tostring(self.profile_loads))
    end

    self.profile_loads = self.profile_loads + 1
  end,

  load_vim_options = function(self)
    -- vim.cmd [[
    --  filetype off
    -- ]]

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

  load_autocommands = function(self)
    for group, commands in pairs(self.autocommands) do
      local augroup = vim.api.nvim_create_augroup(group, { clear = true })

      for _, cmd in ipairs(commands) do
        vim.api.nvim_create_autocmd(cmd.event, {
         pattern  = cmd.pattern,
         group    = augroup,
         command  = cmd.command,
         callback = cmd.callback,
        })
      end
    end
  end,

  load_keymaps = function(self)
    for _, group in pairs(self.keymaps) do
      for _, mapping in ipairs(group) do
        vim.keymap.set(unpack(mapping))
      end
    end
  end,

  setup_rg = function(self)
    if (self.use_rg) then
      vim.opt.grepprg = 'rg --color=never'
    end
  end,

  setup_zsh = function(self)
    if (self.use_zsh and vim.fn.executable('/bin/zsh') == 1) then
      vim.opt.shell = '/bin/zsh -l'
    end
  end,

  setup_fzf = function(self)
    if self.use_fzf then
      vim.cmd [[
        set rtp+=/usr/local/opt/fzf
      ]]
    end
  end,

  setup_linter = function(self)
    if type(self.use_lint) == 'table' then
      if type(self.use_lint.linters_by_ft) == 'table' then
        require('lint').linters_by_ft = self.use_lint.linters_by_ft

        local pattern = self.use_lint.file_pattern or { "*.rb", "*.erb", "*.haml", "*.slim" }

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
          pattern = pattern,
          callback = function()
            require("lint").try_lint()
          end,
        })

        vim.api.nvim_create_autocmd({ "BufRead" }, {
          pattern = pattern,
          callback = function()
            require("lint").try_lint()
          end,
        })
      end
    end
  end,

  setup_treesitter = function(self)
    if type(self.use_treesitter) ~= 'table' or type(self.use_treesitter.languages) ~= 'table' then return end

    require('nvim-treesitter.configs').setup {
      ensure_installed = self.use_treesitter.languages,
      sync_install     = true,
      auto_install     = true,
      highlight        = { enable = true }
    }
  end,

  setup_start_dashboard = function(self)
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

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,

  setup = function(self, config)
    for k, v in pairs(config) do
      if k ~= 'setup' then self[k] = v end
    end

    self:load_vim_plug_bundle()
    self:load_vim_options()
    self:load_vim_globals()
    self:load_settings_files()

    if type(config.setup) == 'function' then config.setup(self) end

    self:load_keymaps()
    self:load_autocommands()
    self:setup_rg()
    self:setup_zsh()
    self:setup_fzf()
    self:setup_linter()
    self:setup_treesitter()
    self:setup_start_dashboard()
    self:setup_colorscheme()
    self:log_reloading()
  end
}

return TinyNvimLoader
