" === External utils

" use rg
if executable('rg')
  set grepprg=rg\ --color=never
else
  echoe "Please install ripgrep"
end

" zsh
if executable('/bin/zsh')
  set shell=/bin/zsh\ -l
end

" filetype plugin indent on

if has("linebreak")
  let &sbr = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines
endif

" === Don't skip wrap lines
noremap j gj
noremap k gk

" do not hl cursor in term
hi CursorLine cterm=NONE
