" ~ Custom autocommands

" TODO: add augroup custom?

augroup language_detection
  au!

  au BufNewFile,BufRead *.rs     set filetype=rust
  au BufNewFile,BufRead *.yml.j2 set filetype=yaml
  au BufNewFile,BufRead *.cjsx   set filetype=coffee
  au BufNewFile,BufRead *.pcss   set filetype=postcss
  au BufNewFile,BufRead *.arb	   set ft=ruby
  au BufNewFile,BufRead *.lmx    set filetype=haml

  " for alternative Gemfiles
  au BufNewFile,BufRead Gemfile_* let &filetype = 'ruby'
augroup END

augroup languages_settings
  au!

  " pretty colymn hi for yaml modes
  au FileType yaml setlocal cursorcolumn
  au FileType eruby.yaml setlocal cursorcolumn

  " js with 2 tabs
  au FileType javascript setl sw=2 sw=2 sts=2
augroup END

augroup reload_buffer_on_change
  au!
  au BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
augroup END

augroup auto_remove_trailing_whitespaces
  au BufWritePre * :%s/\s\+$//e
augroup END

augroup terminal_settings
  autocmd!

  autocmd BufWinEnter term://* startinsert
  " autocmd WinEnter term://* startinsert
  autocmd BufLeave term://* stopinsert

  " go back to insert mode when entering the terminal window
  autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
augroup END

" config prefered searcher for AnyJump
au BufNewFile,BufRead * let b:preferred_searcher = 'rg'
