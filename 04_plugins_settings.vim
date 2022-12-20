let s:nvim = has('nvim')

" ~ NERDTree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1 " Disables display of the 'Bookmarks' label and 'Press ? for help' text.
let NERDTreeDirArrows=0 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.
let NERDTreeIgnore=['\.git$']
let NERDTreeStatusline=0
let NERDTreeWinSize=25

" ~ javascript-libraries-syntax.vim
let g:used_javascript_libs = 'underscore, backbone, angularjs'

" ~ markdown
let g:vim_markdown_folding_disabled=1

" ~ vim-test
if s:nvim
  let test#strategy = "dispatch"
  let test#neovim#term_position = "rightbelow 15"
  let test#preserve_screen = 1
else
  let test#neovim#term_position = "rightbelow"
endif

" ~ ruby
let g:ruby_path             = system('rbenv prefix')
let g:ruby_host_prog        = system('rbenv prefix')
let g:ruby_operators        = 1
let g:ruby_pseudo_operators = 1
let g:ruby_no_expensive     = 1

" ~ esearch
let g:esearch = {}

" Set the initial pattern content using the highlighted '/' pattern (if
" v:hlsearch is true), the last searched pattern or the clipboard content.
let g:esearch.prefill = ['hlsearch', 'last', 'clipboard']
let g:esearch.live_update = v:true

" ~ org-mode
let g:org_agenda_files = ['~/orgs/*.org']

" ~ ruby
let g:ruby_operators        = 1
let g:ruby_pseudo_operators = 1
let g:ruby_no_expensive = 1

" ~ any-jump.vim config
let g:any_jump_search_prefered_engine = 'rg'
let g:any_jump_ignored_files = ['*.tmp', '*.temp', 'tags']


" ~ Lightline settings
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste', 'gutentags', 'method' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'Fugitive#Head',
      \   'gutentags': "gutentags#statusline",
      \ },
      \ }

" ~ Getuntags
augroup MyGutentagsStatusLineRefresher
    autocmd!
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
augroup END

let g:gutentags_define_advanced_commands = 1
let g:gutentags_ctags_exclude = ['*.js', '*.jsx', '*.coffee', '*.js.erb', 'node_modules']

if executable('rg')
  let g:gutentags_file_list_command = 'rg --files'
end

" hi MsgSeparator guifg=#ff00ff

let g:terminal_key = '<c-=>'

" ~ vim-table-mode
let g:table_mode_corner='|'

" ~ vim hexokinase (display css/rgb colors)
let g:Hexokinase_highlighters = ['background']

" nvim-cursorword
" hi default CursorWord cterm=underline gui=underline
hi default CursorWord cterm=underline guifg=#ff00ff
