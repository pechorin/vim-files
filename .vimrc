lua << EOF
  -- TODO: add autoresizer command
  -- Config structure:
  --
  -- .vimrc
  -- init.lua
  --   general.vim
  --   autocommands.vim
  --   mappings.vim
  --   plugins.vim
  --   plugins.lua
  --   /plugins
  --      plugins/fzf.lua
  --      plugins/lsp
  --      plugins/...
  --      etc
  -- TODO: test in macvim

  function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
  end

  if not _G.profile_loads then
    _G.profile_loads = 0
  end

  if _G.profile_loads > 1 then
    print("reloading profile " .. tostring(_G.profile_loads))
  end

  -- Base config variables
  local nvim = vim.fn.has('nvim') == 1

  if not nvim then
    vim.cmd([[
      set nocompatible " be iMproved
    ]])
  end

  vim.cmd([[
    filetype off
  ]])

  local vim_files_path  = vim.fn.resolve(vim.fn.expand('<sfile>:p'))
  vim_files_path        = vim.fn.substitute(vim_files_path, ".vimrc", '', '') -- TODO: use lua
  vim_files_path        = vim.fn.substitute(vim_files_path, "init.lua", '', '') -- TODO: use lua
  local plugins_path    = vim_files_path .. 'plugins/'
  local plugins_entries = vim.fn.readdir(plugins_path, [[ v:val =~ '\.lua$' || v:val =~ '\.vim' ]])

  -- Vim-plug bundle list
  vim.fn.execute('source ' .. vim_files_path .. '/bundle.vim')

  -- Main settings
  local main_settings = {
    '01_general.vim',
    '02_autocommands.vim',
    '03_mappings.vim',
    '04_plugins.vim',
    '04_plugins.lua'
  }

  for _, setting_file in ipairs(main_settings) do
    vim.fn.execute('source ' .. vim_files_path .. setting_file)
  end

  -- Specific plugins settings
  for _, file in ipairs(plugins_entries) do
    local plugin_path = plugins_path .. file
    vim.fn.execute('source ' .. plugin_path)
  end

  -- Set colorscheme once at first profile load
  if _G.profile_loads == 0 then
    if nvim then
      vim.opt.bg = 'light'
      vim.cmd.colorscheme 'adwaita'
    else
      vim.cmd.colorscheme 'Tomorrow'
    end
  end

  _G.profile_loads = _G.profile_loads + 1
EOF
