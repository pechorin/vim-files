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

-- Base config variables
local nvim           = vim.fn.has('nvim') == 1
local vim_files_path = vim.fn.resolve(vim.fn.expand('<sfile>:p'))
vim_files_path       = vim.fn.substitute(vim_files_path, ".vimrc", '', '') -- TODO: use lua
vim_files_path       = vim.fn.substitute(vim_files_path, "init.lua", '', '') -- TODO: use lua

-- vim.cmd("source ./helpers.lua")
-- local vim_files_path = MyCfg.vim_files_path()

-- Load main settings
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

-- Load specific plugins settings
local plugins_path    = vim_files_path .. 'plugins/'
local plugins_entries = vim.fn.readdir(plugins_path, [[ v:val =~ '\.lua$' || v:val =~ '\.vim' ]])

for _, file in ipairs(plugins_entries) do
  local plugin_path = plugins_path .. file
  vim.fn.execute('source ' .. plugin_path)
end
