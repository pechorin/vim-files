" Load lua config from ~/.vim/init.lua
let s:current_script = resolve(expand('<sfile>:p'))
let s:scripts_path = substitute(s:current_script, '\.vimrc', '', '')
exec 'source ' . s:scripts_path . 'init.lua'
