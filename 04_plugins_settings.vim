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

" ~ tree-sitter
if s:nvim
lua <<EOF
  require('nvim-treesitter.configs').setup {
    ensure_installed = {
      "c", "cpp", "lua", "bash", "ruby",
      "go", "rust", "css", "html", "javascript",
      "json", "regex", "typescript", "vue", "python"
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,
    auto_install = true,
    highlight = {
      enable = true,
    }
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

" ~ vim hexokinase (display css/rgb colors)
let g:Hexokinase_highlighters = ['background']

if s:nvim
lua <<EOF

-- ~ neo-tree
require("neo-tree").setup({
  enable_git_status = true,
  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 0,
    },
    icon = {
      folder_closed = ">",
      folder_open = "-",
      folder_empty = "ﰊ",
    },
    modified = {
      symbol = "[+]"
    }
  },
  window = {
    width = 25
  },
  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        "node_modules",
        "tags",
      },
      never_show = {
        ".DS_Store"
      }
    },
    follow_current_file = true,
    use_libuv_file_watcher = true,
  }
})

-- ~ ray-x/go.nvim
require('go').setup({
  -- goimport = 'gopls', -- if set to 'gopls' will use golsp format
  -- gofmt = 'gopls', -- if set to gopls will use golsp format
  -- lsp_cfg = true,
  -- lsp_on_attach = true,
})

-- format on save
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').gofmt()
  end,
  group = format_sync_grp,
})

-- ~ symbols-outline.nvim
require("symbols-outline").setup({
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = false,
  position = 'right',
  relative_width = true,
  width = 25,
  auto_close = false,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  preview_bg_highlight = 'Pmenu',
  autofold_depth = nil,
  auto_unfold_hover = true,
  fold_markers = { '', '' },
  wrap = false,
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = {"<Esc>", "q"},
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = "h",
    unfold = "l",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  },
  lsp_blacklist = {},
  symbol_blacklist = {},
  symbols = {
    File = {icon = "", hl = "TSURI"},
    Module = {icon = "", hl = "TSNamespace"},
    Namespace = {icon = "", hl = "TSNamespace"},
    Package = {icon = "", hl = "TSNamespace"},
    Class = {icon = "𝓒", hl = "TSType"},
    Method = {icon = "ƒ", hl = "TSMethod"},
    Property = {icon = "", hl = "TSMethod"},
    Field = {icon = "", hl = "TSField"},
    Constructor = {icon = "", hl = "TSConstructor"},
    Enum = {icon = "ℰ", hl = "TSType"},
    Interface = {icon = "ﰮ", hl = "TSType"},
    Function = {icon = "", hl = "TSFunction"},
    Variable = {icon = "", hl = "TSConstant"},
    Constant = {icon = "", hl = "TSConstant"},
    String = {icon = "𝓐", hl = "TSString"},
    Number = {icon = "#", hl = "TSNumber"},
    Boolean = {icon = "⊨", hl = "TSBoolean"},
    Array = {icon = "", hl = "TSConstant"},
    Object = {icon = "⦿", hl = "TSType"},
    Key = {icon = "🔐", hl = "TSType"},
    Null = {icon = "NULL", hl = "TSType"},
    EnumMember = {icon = "", hl = "TSField"},
    Struct = {icon = "𝓢", hl = "TSType"},
    Event = {icon = "🗲", hl = "TSType"},
    Operator = {icon = "+", hl = "TSOperator"},
    TypeParameter = {icon = "𝙏", hl = "TSParameter"}
  }
})

EOF
end

" nvim-cursorword
" hi default CursorWord cterm=underline gui=underline
