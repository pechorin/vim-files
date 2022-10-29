" = Vim/nvim setup

let s:nvim = has('nvim')

" TODO: is it still required?
let s:enable_tree_sitter = v:true

if !exists('s:profile_loads')
  let s:profile_loads = 0
endif

if s:profile_loads > 1
  echo "reloading profile " . string(s:profile_loads)
endif

" let text = substitute(text, '\n', '', 'g')
if !s:nvim
  set nocompatible " be iMproved
endif

filetype off

" = Init Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/bundle')

" Common plugins
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/CursorLineCurrentWindow'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'vim-utils/vim-man'
Plug 'adelarsq/vim-matchit'
Plug 'simeji/winresizer'
Plug 'pechorin/any-jump.vim'

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

" Table-mode support
Plug 'dhruvasagar/vim-table-mode'

" == Languages
Plug 'tpope/vim-rbenv'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
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
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'lepture/vim-jinja'
Plug 'ap/vim-css-color'
Plug 'pearofducks/ansible-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'chr4/nginx.vim'

" == Colorschemes
Plug 'ChrisKempson/Tomorrow-Theme', { 'rtp' : 'vim' }
Plug 'danilo-augusto/vim-afterglow'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'savq/melange'
Plug 'projekt0n/github-nvim-theme'
Plug 'elvessousa/sobrio'
Plug 'NLKNguyen/papercolor-theme'
Plug 'gzagatti/vim-leuven-theme'
Plug 'carakan/new-railscasts-theme'

" == color mono contrast schemes
Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
Plug 'kkga/vim-envy'
Plug 'yasukotelin/shirotelin'

if s:nvim
  Plug 'ray-x/go.nvim'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'neovim/nvim-lsp'
  Plug 'neovim/nvim-lspconfig'
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'hrsh7th/nvim-compe'
  Plug 'folke/lsp-colors.nvim'
  Plug 'folke/which-key.nvim'
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
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

" === General vim options

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

" set scrolloff=15  " makes vim centered like a iA Writer
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
  colorscheme Tomorrow
endif

" do not hl cursor in term
hi CursorLine cterm=NONE

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1 " Disables display of the 'Bookmarks' label and 'Press ? for help' text.
let NERDTreeDirArrows=0 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.
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
let g:ruby_path             = system('rbenv prefix')
let g:ruby_host_prog        = system('rbenv prefix')
let g:ruby_operators        = 1
let g:ruby_pseudo_operators = 1
let g:ruby_no_expensive     = 1

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
let g:any_jump_ignored_files = ['*.tmp', '*.temp', 'tags']

"  fzf configuration
let g:fzf_preview_window = ''

"  fzf with floating windows support
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

" --- Lightline settings
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


" tree-sitter
if s:nvim && s:enable_tree_sitter == v:true
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

let g:terminal_key = '<c-=>'

lua <<EOF
  local lsp_config = require('lspconfig')

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

  -- TODO: this is crap :)
  lsp_config.solargraph.setup {
    cmd = {vim.fn.getenv('HOME') .. '/.rbenv/versions/2.7.6/bin/solargraph', 'stdio'},
    on_attach = on_attach,
    settings = {
      commandPath = vim.fn.getenv('HOME') .. '/.rbenv/versions/2.7.6/bin/solargraph',
      useBunlder = true,
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
    lsp_cfg = true, -- true: apply go.nvim non-default gopls setup
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

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      -- delay update diagnostics
      update_in_insert = false,
    }
  )

  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
  })

  -- Print diagnostics to message area
  function PrintDiagnostics(opts, bufnr, line_nr, client_id)
    bufnr = bufnr or 0
    line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
    opts = opts or {['lnum'] = line_nr}

    local line_diagnostics = vim.diagnostic.get(bufnr, opts)
    if vim.tbl_isempty(line_diagnostics) then return end

    local diagnostic_message = ""
    for i, diagnostic in ipairs(line_diagnostics) do
      diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
      print(diagnostic_message)
      if i ~= #line_diagnostics then
        diagnostic_message = diagnostic_message .. "\n"
      end
    end
    vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
  end

  vim.cmd [[ autocmd! CursorHold * lua PrintDiagnostics() ]]

  -- Show line diagnostics automatically in hover window

  vim.o.updatetime = 250
  vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

EOF

" --- end profile loading
let s:profile_loads += 1

if !exists('s:known_links')
  let s:known_links = {}
endif

" ~ Load configs
let s:current_script = resolve(expand('<sfile>:p'))
let s:scripts_path = substitute(s:current_script, '\.vimrc', '', '')
" let s:configs_path = s:scripts_path . '.vim/config/'

let configs = ['mappings.vim', 'autocommands.vim']

for config in configs
  let config_path = s:scripts_path . config
  exec 'source' . config_path
endfor
