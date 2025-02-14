" Vim support dropped
if !has('nvim')
  echo "only nvim supported"
  finish
endif

" Starting point of config -> 00_init.lua
let s:lua_config_path = substitute(resolve(expand('<sfile>:p')), ".vimrc", '', '') .. '00_init.lua'
execute('source ' .. s:lua_config_path)

" TODO:
" - [ ] use shift `[` and `]` for tab navigation (or other key)
" - [ ] when deleting do not yank
" - [ ] better :s//
