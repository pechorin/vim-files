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
let g:esearch = { 'adapter': 'rg', 'backend': 'system', 'out': 'qflist' }

" ~ Golang
let g:go_code_completion_enabled = v:false " cause we use nvim-compe
let g:go_test_show_name          = v:true
let g:go_doc_popup_window        = v:true
let g:go_fold_enable             = []

let g:go_highlight_extra_types           = 1
let g:go_highlight_operators             = 1
let g:go_highlight_functions             = 1
let g:go_highlight_function_parameters   = 1
let g:go_highlight_function_calls        = 1
let g:go_highlight_types                 = 1
let g:go_highlight_fields                = 1
" let g:go_highlight_format_strings        = 1
" let g:go_highlight_generate_tags         = 1
" let g:go_highlight_variable_declarations = 1
" let g:go_highlight_variable_assignments  = 1

let g:go_mod_fmt_autosave = 1
let g:go_fmt_autosave = 1

" ~ org-mode
let g:org_agenda_files = ['~/orgs/*.org']

" ~ ruby
let g:ruby_operators        = 1
let g:ruby_pseudo_operators = 1
let g:ruby_no_expensive = 1

" ~ any-jump.vim config
let g:any_jump_search_prefered_engine = 'rg'
let g:any_jump_ignored_files = ['*.tmp', '*.temp', 'tags']

" ~  fzf configuration
let g:fzf_preview_window = ''

" ~ fzf with floating windows support
if s:nvim
  " TODO: implement vim support
  set wildoptions=pum
  set pumblend=0
  set inccommand=nosplit

  " set floatblend=8

  " == Floating FZF

  " Reverse the layout to make the FZF list top-down
  " let $FZF_DEFAULT_OPTS='--layout=reverse'

  " Using the custom window creation function
  let g:fzf_layout = { 'window': 'call FloatingFZF()' }

  " Function to create the custom floating window
  function! FloatingFZF()
    " creates a scratch, unlisted, new, empty, unnamed buffer
    " to be used in the floating window
    let buf = nvim_create_buf(v:false, v:true)

    " 90% of the height
    let height = float2nr(&lines * 0.7)
    " 60% of the height
    let width = float2nr(&columns * 0.5)
    " horizontal position (centralized)
    let horizontal = float2nr((&columns - width) / 2)
    " vertical position (one line down of the top)
    let vertical = 2

    let opts = {
          \ 'relative': 'editor',
          \ 'row': vertical,
          \ 'col': horizontal,
          \ 'width': width,
          \ 'height': height
          \ }

    " open the new window, floating, and enter to it
    call nvim_open_win(buf, v:true, opts)
  endfunction
endif

" TODO: what plugin is this?
let g:CoolTotalMatches = 1

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

" ~ tree-sitter
if s:nvim
lua <<EOF
  require('nvim-treesitter.configs').setup {
    ensure_installed = { "c", "cpp", "lua", "bash", "ruby", "go", "rust", "css", "html", "javascript", "json", "regex", "typescript", "vue", "python" },
     -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true }
  }
EOF
end

" hi MsgSeparator guifg=#ff00ff

let g:terminal_key = '<c-=>'

" ~ vim-table-mode
let g:table_mode_corner='|'

lua <<EOF
  require("which-key").setup({})
EOF
