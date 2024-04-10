let s:nvim = has('nvim')

" ~ NERDTree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI  = 1 " Disables display of the 'Bookmarks' label and 'Press ? for help' text.
let NERDTreeDirArrows  = 0 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.
let NERDTreeIgnore     = ['\.git$']
let NERDTreeStatusline = 0
let NERDTreeWinSize    = 25

" ~ javascript-libraries-syntax.vim
let g:used_javascript_libs = 'underscore, backbone, angularjs'

" ~ markdown
let g:vim_markdown_folding_disabled = 1

" ~ vim-test
if s:nvim
  let test#strategy             = "neovim"
  let test#neovim#term_position = "rightbelow 25"
  let test#preserve_screen      = 1
  let test#neovim#start_normal  = 1
else
  let test#neovim#term_position = "rightbelow"
endif

let test#ruby#rspec#options = {
  \ 'file': '--format documentation',
\}

" ~ ruby
let g:ruby_path             = system('rbenv prefix')
let g:ruby_host_prog        = substitute(system('rbenv prefix') .. '/bin/ruby', "\n", '', 'g')
let g:ruby_operators        = 1
let g:ruby_pseudo_operators = 1
let g:ruby_no_expensive     = 1

" ~ esearch
let g:esearch = {}
let g:esearch.win_map = [
 \ ['n', 'gq',  ':call esearch#init(extend(copy(b:esearch), {"out": "qflist"}))<cr>'  ],
 \ ['n', 'gsp', ':call esearch#init(extend(b:esearch, sort_by_path))<cr>'             ],
 \ ['n', 'gsd', ':call esearch#init(extend(b:esearch, sort_by_date))<cr>'             ],
\ ]

" Set the initial pattern content using the highlighted '/' pattern (if
" v:hlsearch is true), the last searched pattern or the clipboard content.
let g:esearch.prefill = ['last', 'clipboard']
let g:esearch.live_update = v:true
let g:esearch.win_new = {esearch -> esearch#buf#goto_or_open(esearch.name, 'new')}

" Helpers to use in keymaps.
let g:sort_by_path = {'adapters': {'rg': {'options': '--sort path'}}}
let g:sort_by_date = {'adapters': {'rg': {'options': '--sort modified'}}}
" NOTE: {'backend': 'system'} means synchronous reload using system() call to stay within the same context
let g:AddAfter = {n -> {'after': b:esearch.after + n, 'backend': 'system'}}

" ~ ruby
let g:ruby_operators        = 1
let g:ruby_pseudo_operators = 1
let g:ruby_no_expensive     = 1

" ~ any-jump.vim config
let g:any_jump_search_prefered_engine = 'rg'
let g:any_jump_ignored_files          = ['*.tmp', '*.temp', 'tags']


let g:gutentags_define_advanced_commands = 1
let g:gutentags_ctags_exclude            = ['*.js', '*.jsx', '*.coffee', '*.js.erb', 'node_modules']

if executable('rg')
  let g:gutentags_file_list_command = 'rg --files'
end

" hi MsgSeparator guifg=#ff00ff

" ~ vim-table-mode
let g:table_mode_corner='|'

" onedark theme config
let g:onedark_config = { 'style': 'warmer' }

" nvim-cursorword
" hi default CursorWord cterm=underline gui=underline
" hi default CursorWord cterm=underline guifg=#ff00ff

" minimap
let g:minimap_git_colors = v:true

" winresize
let g:winresizer_vert_resize = 25
let g:winresizer_horiz_resize = 5
