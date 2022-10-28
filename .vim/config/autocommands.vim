" ~ Custom autocommands

" TODO: add augroup custom?

au BufNewFile,BufRead *.rs     set filetype=rust
au BufNewFile,BufRead *.yml.j2 set filetype=yaml
au BufNewFile,BufRead *.cjsx   set filetype=coffee
au BufNewFile,BufRead *.pcss   set filetype=postcss
au BufNewFile,BufRead *.arb	   set ft=ruby
au BufNewFile,BufRead *.lmx    set filetype=haml

" pretty colymn hi for yaml modes
autocmd FileType yaml setlocal cursorcolumn
autocmd FileType eruby.yaml setlocal cursorcolumn

" js with 2 tabs - is ok
autocmd FileType javascript setl sw=2 sw=2 sts=2

" custom types autocmd mappinngs
autocmd FileType nasm setlocal commentstring=;\ %s

" auto-remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" config prefered searcher for AnyJump
autocmd BufNewFile,BufRead * let b:preferred_searcher = 'rg'

" for alternative Gemfiles
autocmd BufNewFile,BufRead Gemfile_* let &filetype = 'ruby'

" Start terminal in insert mode
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif

" reload buffer on change
augroup checktime
  au!
  autocmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
augroup END
