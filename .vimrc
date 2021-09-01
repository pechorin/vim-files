" == My custom vimscript

" = TODO =
" - split initialization to files for big parts (like lsp)

let s:nvim = has('nvim')
let s:enable_tree_sitter = v:true

if !exists('s:profile_loads')
  let s:profile_loads = 0
endif

if s:profile_loads > 1
  echo "reloading profile " . string(s:profile_loads)
endif

if !s:nvim
  set nocompatible " be iMproved
endif

filetype off

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/bundle')

" === Common plugins

" TODO: THINK: how to provide meta info about each plugin:
"              - git repo
"              - plugin category
"              - keydings
"              - description
"              - init code

" General plugins
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/CursorLineCurrentWindow'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'vim-utils/vim-man'
" Plug 'itchyny/vim-cursorword'

" Searching
Plug 'eugen0329/vim-esearch'
Plug 'romainl/vim-cool'

" Git support
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'

" Tests
Plug 'tpope/vim-dispatch'
Plug 'janko-m/vim-test'

" CTags support
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" Fuzzy engine for fast selection menus
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" === Languages
Plug 'tpope/vim-rbenv'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-haml'
Plug 'plasticboy/vim-markdown'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mitsuhiko/jinja2'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'calviken/vim-gdscript3'
Plug 'lepture/vim-jinja'
Plug 'ap/vim-css-color'

Plug 'ekalinin/Dockerfile.vim'
Plug 'chr4/nginx.vim'

" === Colorschemes
Plug 'ChrisKempson/Tomorrow-Theme', { 'rtp' : 'vim' }
Plug 'danilo-augusto/vim-afterglow'
Plug 'KabbAmine/yowish.vim'
Plug 'sainnhe/sonokai'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'mhartington/oceanic-next'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'savq/melange'

" === In-testing plugins
Plug 'simeji/winresizer'
Plug 'folke/lsp-colors.nvim'
Plug 'folke/which-key.nvim'
Plug 'ray-x/go.nvim'

" Plugins i'm working on:
Plug 'pechorin/any-jump.vim'

if s:nvim
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'hrsh7th/nvim-compe'
  Plug 'neovim/nvim-lsp'
  Plug 'neovim/nvim-lspconfig'
  Plug 'ray-x/lsp_signature.nvim'
end

call plug#end()

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

filetype plugin indent on

" === Vim options

set showmode       " always show what mode we're currently editing in

" set completion options
set complete=.,w,b,u,t,i

" update interval
set updatetime=1000

set encoding=utf-8
set fileencodings=utf-8,cp1251
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

set wildmenu       " display command-line autocomplete variants
set wildmode=full
set wildignore+=.hg,.git,.svn,*.DS_Store,*.pyc

set title          " change the terminal's title

set visualbell     " Use visual bell instead of beeping

set scrolloff=15  " makes vim centered like a iA Writer
set showtabline=1  " display tabline only if where is more then one tab

set linebreak      "

set autoindent     " always set autoindenting on
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set cursorline
set splitbelow
set splitright
set mousehide      " Hide the mouse when typing text
set laststatus=2

set hidden         " this allows to edit several files in the same time without having to save them

if has("linebreak")
  let &sbr = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines
endif

set incsearch      " show search matches as you type
set ignorecase     " ignore case when searching
set smartcase
set showmatch      " set show matching parenthesis
set gdefault       " all matches in a line are substituted instead of one.

" === Don't skip wrap lines
noremap j gj
noremap k gk

set history=1000    " store lots of :cmdline history
set undolevels=1000 " use many muchos levels of undo
set nobackup        " no backup files
set nowritebackup   " only in case you don't want a backup file while editing
set noswapfile      " no swap files
set timeoutlen=500

set completeopt=menuone,noselect

set mouse=a

" === GUI
syntax on

if !has("nvim")
  set guifont=Monaco:h14
endif

set guioptions-=T  " remove gui toolbar
set guioptions-=l  " remove left-hand scrollbar
set guioptions-=L  " remove left-hand scrollbar
" set guioptions+=a  " automatically add selected text in the VISUAL mode to system copy-paste buffer
" set guioptions-=e  " remove gui tabs

" term options
set termguicolors

" theme options, applied only first script load
if s:profile_loads == 0
  let g:sonokai_style = 'shusia'
  let g:sonokai_enable_italic = 0
  let g:sonokai_disable_italic_comment = 0

  " colorscheme desert
  colorscheme Tomorrow
  " colorscheme palenight
  " colorscheme base16-railscasts
endif

" do not hl cursor in term
hi CursorLine cterm=NONE

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1 " Disables display of the 'Bookmarks' label and 'Press ? for help' text.
let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.
let NERDTreeIgnore=['\.git$']
let NERDTreeStatusline=0
let NERDTreeWinSize=25


" javascript-libraries-syntax.vim
let g:used_javascript_libs = 'underscore, backbone, angularjs'

" markdown
let g:vim_markdown_folding_disabled=1

" vim-test
if s:nvim
  let test#strategy = "dispatch"
  let test#neovim#term_position = "rightbelow 15"
  let test#preserve_screen = 1
else
  let test#neovim#term_position = "rightbelow"
endif

"  ruby
let ruby_operators        = 1
let ruby_pseudo_operators = 1

" esearch
let g:esearch = { 'adapter': 'rg', 'backend': 'system', 'out': 'qflist' }

" --- Golang
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

" --- org-mode
let g:org_agenda_files = ['~/orgs/*.org']

" --- ruby
let g:ruby_operators        = 1
let g:ruby_pseudo_operators = 1
let g:ruby_no_expensive = 1

" --- any-jump.vim config
let g:any_jump_search_prefered_engine = 'rg'

"  fzf configuration
let g:fzf_preview_window = ''

"  with floating windows support
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

let g:CoolTotalMatches = 1

" --- Lightline settings
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste', 'gutentags', 'method' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'gutentags': "gutentags#statusline",
      \ },
      \ }

" --- Getuntags

augroup MyGutentagsStatusLineRefresher
    autocmd!
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
augroup END

let g:gutentags_define_advanced_commands = 1
" let g:gutentags_trace = 1

let g:gutentags_ctags_exclude = ['*.js', '*.jsx', '*.coffee', '*.js.erb', 'node_modules']

if executable('rg')
  let g:gutentags_file_list_command = 'rg --files'
end

" --- Custom bindings/mappings/autocommands ---

" TODO: add augroup custom?
" TODO: move to separate file?

" remap ; to :
nmap ; :

" set leader key
let mapleader=","
let maplocalleader= "\\"

" https://github.com/r00k/dotfiles/blob/master/vimrc
" Disable that goddamn 'Entering Ex mode. Type 'visual' to go to Normal mode.'
" that I trigger 40x a day.
map Q <Nop>
" Disable K looking man stuff up
" map K <Nop>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" === haml
au BufNewFile,BufRead *.lmx set filetype=haml

" pretty colymn hi for yaml modes
autocmd FileType yaml setlocal cursorcolumn
autocmd FileType eruby.yaml setlocal cursorcolumn

" js with 2 tabs - is ok
autocmd FileType javascript setl sw=2 sw=2 sts=2

" custom types autocmd mappinngs
autocmd FileType nasm setlocal commentstring=;\ %s

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" auto-remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" config prefered searcher for DimJump
autocmd BufNewFile,BufRead * let b:preferred_searcher = 'rg'

" for alternative Gemfiles
autocmd BufNewFile,BufRead Gemfile_* let &filetype = 'ruby'

" Start terminal in insert mode
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif

au BufNewFile,BufRead *.rs     set filetype=rust
au BufNewFile,BufRead *.yml.j2 set filetype=yaml
au BufNewFile,BufRead *.cjsx   set filetype=coffee
au BufNewFile,BufRead *.pcss   set filetype=postcss
au BufNewFile,BufRead *.arb	   set ft=ruby

" reload buffer on change
augroup checktime
  au!
  autocmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
augroup END


" ~ Navigation utilities mappings ~

" Buffers lists
nmap <leader>b :Buffers<CR>

" Tagbar
map <leader>et :Tagbar<CR>

" NERDTree for current working dir
nmap <leader>n :NERDTree<CR>

" NERDTree for current file
nmap <leader>N :NERDTree %<CR>

" ~ Buffer functions mappings ~

" comment current line
nmap <leader>c <Plug>CommentaryLine

" comment block in visual mode
vmap <leader>c <Plug>Commentary

" new tab
map <leader>t :tabnew<CR>
map <cmd>t :tabnew<CR>

" ~ FZF mappings ~

" current project files
nmap <leader>q :Files<CR>

" helptags
map <leader>sh :Helptags <CR>

" theme switcher
map <leader>st :Color <CR>

" eval current vimscrupt buffer
map <leader>ee :so %<CR>

" open $MYVIMRC
map <leader>ev :vsplit ~/.vimrc <CR>

" redraw tree-sitter colors
map <leader>ed :TSBufEnable highlight <CR>

" fugitive.vim
map <leader>gs :Git <CR>
map <leader>gl :Git log <CR>

" remap clipboard in osx
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" tests runner
nmap <silent> <leader>rf :TestFile<CR>
nmap <silent> <leader>rn :TestNearest<CR>
nmap <silent> <leader>rs :TestSuite<CR>
nmap <silent> <leader>rl :TestLast<CR>

" Show the quickfix window
nnoremap <Leader>co :copen<CR>

" Hide the quickfix window
nnoremap <Leader>cc :cclose<CR>

" tree-sitter
if s:nvim && s:enable_tree_sitter == v:true
lua <<EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "cpp", "lua", "bash", "ruby", "go", "rust", "css", "html", "javascript", "json", "regex", "typescript", "vue", "python" },
     -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true }
  }
EOF

end

" nvim-compe
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:false
let g:compe.source.vsnip = v:false
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.spell = v:false
let g:compe.source.tags = v:true
let g:compe.source.snippets_nvim = v:false
let g:compe.source.treesitter = v:false
let g:compe.source.omni = v:false

" hi MsgSeparator guifg=#ff00ff

" experimetal lsp support:

lua <<EOF
  local lsp_config = require'lspconfig'

  vim.lsp.set_log_level("debug")

  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    require "lsp_signature".on_attach({
      bind = true,
      hint_prefix = "🔸",
      max_width = 70,
      extra_trigger_chars = {","},
      handler_opts = {
        border = "shadow"
      }
    })
  end

  lsp_config.rust_analyzer.setup {
      cmd = { "rust-analyzer" },
      filetypes = { "rust" },
      on_attach = on_attach,
      root_dir = lsp_config.util.root_pattern("Cargo.toml", "rust-project.json"),
      settings = {
        ["rust-analyzer"] = {
            assist = {
                importMergeBehavior = "last",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
  }

  lsp_config.gopls.setup {
    on_attach = on_attach
  }

  lsp_config.solargraph.setup{
    on_attach = on_attach,
    settings = {
      useBunlder = true
    }
  }

  require("which-key").setup({})

  require('go').setup({
    goimport='goimports', -- goimport command
    gofmt = 'gofmt', --gofmt cmd,
    max_line_len = 120, -- max line length in goline format
    tag_transform = false, -- tag_transfer  check gomodifytags for details
    test_template = '', -- default to testify if not set; g:go_nvim_tests_template  check gotests for details
    test_template_dir = '', -- default to nil if not set; g:go_nvim_tests_template_dir  check gotests for details
    comment_placeholder = '' ,  -- comment_placeholder your cool placeholder
    verbose = false,  -- output loginf in messages
    lsp_cfg = false, -- true: apply go.nvim non-default gopls setup
    lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
    lsp_on_attach = true, -- if a on_attach function provided:  attach on_attach function to gopls
                          -- true: will use go.nvim on_attach if true
                          -- nil/false do nothing
    gopls_cmd = nil,
    lsp_diag_hdlr = true, -- hook lsp diag handler
    dap_debug = false, -- set to true to enable dap
    dap_debug_keymap = true, -- set keymaps for debugger
    dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
    dap_debug_vt = true, -- set to true to enable dap virtual text
  })
EOF

" --- end profile loading
let s:profile_loads += 1

if !exists('s:known_links')
  let s:known_links = {}
endif
