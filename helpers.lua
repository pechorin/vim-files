local nvim = vim.fn.has('nvim') == 1

local function vim_files_path()
  local vim_files_path = vim.fn.resolve(vim.fn.expand('<sfile>:p'))
  local vim_files_path       = vim.fn.substitute(vim_files_path, ".vimrc", '', '') -- TODO: use lua
  local vim_files_path       = vim.fn.substitute(vim_files_path, "init.lua", '', '') -- TODO: use lua

  return vim_files_path
end

_G.MyCfg = {
  nvim = nvim,
  vim_files_path = vim_files_path
}
