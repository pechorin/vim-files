if !has('nvim')
  set nocompatible " be iMproved
  echo "only nvim supported"
  finish
endif

let s:lua_config_path = substitute(resolve(expand('<sfile>:p')), ".vimrc", '', '') .. 'init.lua'
execute('source ' .. s:lua_config_path)
