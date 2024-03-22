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

local nvim = vim.fn.has('nvim')

local current_script_path = vim.fn.resolve(vim.fn.expand('<sfile>:p'))
current_script_path = vim.fn.substitute(current_script_path, ".vimrc", '', '')
current_script_path = vim.fn.substitute(current_script_path, "init.lua", '', '')

-- be iMproved (for vim)
if not nvim then
  vim.cmd([[
    nocompatiblee
  ]])
end

-- vim.cmd([[
--   filetype off

--   " = Init Plugins
--   set rtp+=~/.vim/bundle/Vundle.vim
--   call plug#begin('~/.vim/bundle')
-- ]])

-- for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/plugins', [[v:val =~ '\.lua$']])) do
--   require('plugins.'..file:gsub('%.lua$', ''))
-- end
--
-- or -> https://www.reddit.com/r/neovim/comments/zja39t/wrote_some_lua_to_automatically_require_all_lua/
