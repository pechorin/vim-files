local configs = {
  '01_bundle.vim',
  '02_options.vim',
  '03_globals.vim',
  '04_colorscheme.lua',
  '05_autocommands.vim',
  '06_mappings.vim',
  '07_plugins.lua',
  '08_dashboard.lua',
  '09_completion.lua',
  '10_lint.lua',
  '11_treesitter.lua',
  '12_lsp.lua',
  '13_telescope.lua',
}

-- Vim profile load counter
if not _G.profile_loads then _G.profile_loads = 0 end
if _G.profile_loads > 1 then vim.print("reloading profile " .. tostring(_G.profile_loads)) end

-- Detect settings directory
local vim_files_path  = vim.fn.resolve(vim.fn.expand('<sfile>:p'))
vim_files_path        = vim.fn.substitute(vim_files_path, "00_init.lua", '', '')

-- Load all configuration files
for _, setting_file in ipairs(configs) do
  vim.fn.execute('source ' .. vim_files_path .. setting_file)
end

-- Track profile load
_G.profile_loads = _G.profile_loads + 1

-- function _G.dump(...)
--   local objects = vim.tbl_map(vim.inspect, {...})
--   print(unpack(objects))
-- end
