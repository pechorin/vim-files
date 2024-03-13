-- Config structure:
--
-- init.lua
--   general.vim
--   autocommands.vim
--   mappings.vim
--   plugins.vim
--   plugins.lua
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
