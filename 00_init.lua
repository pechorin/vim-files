local main_init_file  = '00_init.lua'
function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

-- Vim profile load counter
if not _G.profile_loads then _G.profile_loads = 0 end
if _G.profile_loads > 1 then vim.print("reloading profile " .. tostring(_G.profile_loads)) end

-- Detect settings directory
local vim_files_path  = vim.fn.resolve(vim.fn.expand('<sfile>:p'))
vim_files_path        = vim.fn.substitute(vim_files_path, main_init_file, '', '')

-- Load all configuration files
local configs_paths = io.popen('ls -1 ' .. vim_files_path .. ' | grep -e \"^\\d\" | sort', 'r')
if configs_paths then
  for config_file in configs_paths:lines() do
    if config_file ~= main_init_file then
      vim.fn.execute('source ' .. vim_files_path .. config_file)
    end
  end
end

-- Track profile load
_G.profile_loads = _G.profile_loads + 1
