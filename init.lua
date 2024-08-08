-- [ ] alternative files
-- [ ] rework mappings
-- [ ] remove unnecessary comments

require('nvim-config-loader').setup {
  colorscheme             = 'adwaita',
  bg                      = 'light',

  vim_plug_bundle_path    = '~/.vim/bundle',

  additional_config_files = {
    'lsp.lua',
    'completion.lua',
  },

  nvim_lint = {
    file_pattern  = {"*.rb", "*.erb", "*.haml"},
    linters_by_ft = {
      ruby = {'rubocop'}
    }
  },

  nvim_treesitter = {
    languages = {
      "ruby",
      "bash",
      "lua",
      "c", "cpp",
      "go", "gomod",
      "rust",
      "css", "html", "javascript", "json", "typescript", "vue",
      "python",
      "embedded_template",
      "sql",
      "regex",
      "vim", "vimdoc"
    }
  },

  alpha_start_dashboard = {
    title = 'Hello world!',
    buttons = {
      {"e", " > New File", "<cmd>ene<CR>"},
      {"n", " > Toggle file explorer", "<cmd>Neotree<CR>"},
      {"f", " > Find File", "<cmd>Telescope find_files<CR>"},
      {"F", " > Find Word", "<cmd>Telescope live_grep<CR>"},
      {"m", " > Keymaps", "<cmd>Telescope keymaps<CR>"},
      {"g", " > Git status", "<cmd>Git<CR>"},
      {"u", " > Update plugins", "<cmd>PlugUpdate<CR>"},
      {"H", " > Edit .vimrc", "<cmd>e ~/.vimrc<CR>"},
      {"c", " > Change colorscheme", "<cmd>Telescope themes<CR>"},
    }
  },

  vim_options = {
    wildoptions    = 'pum',
    pumblend       = 0,
    completeopt    = 'menu,menuone,noselect',
    mouse          = 'a',
    -- floatblend     = 8,

    inccommand     = 'nosplit',
    showmode       = true, -- always show what mode we're currently editing in
    termguicolors  = true,
    complete       = '.,w,b,u,t,i', -- set completion options
    omnifunc       = 'syntaxcomplete#Complete',
    updatetime     = 200,
    encoding       = 'utf-8',
    fileencodings  = {'utf-8', 'cp1251'},
    -- t_Co           = '256', -- Explicitly tell Vim that the terminal supports 256 colors

    wildmenu       = true, -- display command-line autocomplete variants
    wildmode       = 'full',
    wildignore     = function() return vim.opt.wildignore + '.hg,.git,.svn,*.DS_Store,*.pyc' end,
    title          = true, -- change the terminal's title

    visualbell     = true, -- Use visual bell instead of beeping
    -- scrolloff      = 15, -- makes vim centered like a iA Writer
    showtabline    = 1, -- display tabline only if where is more then one tab

    linebreak      = true,
    -- showbreak      = vim.fn.nr2char(8618) .. ' ',
    showbreak      = '>> ',
    autoindent     = true, -- always set autoindenting on
    expandtab      = true,
    shiftwidth     = 2,
    tabstop        = 2,
    softtabstop    = 2,
    cursorline     = true,
    splitbelow     = true,
    splitright     = true,
    mousehide      = true, -- Hide the mouse when typing text
    laststatus     = 2,

    hidden         = true, -- this allows to edit several files in the same time without having to save them

    incsearch      = true, -- show search matches as you type
    ignorecase     = true, -- ignore case when searching
    smartcase      = true,
    showmatch      = true, -- set show matching parenthesis
    gdefault       = true, -- all matches in a line are substituted instead of one.

    history        = 1000, -- store lots of :cmdline history
    undolevels     = 1000, --  use many muchos levels of undo
    timeoutlen     = 250,

    swapfile       = false,

    langmap        = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'
  },


  vim_plug_bundle = {
    { 'ray-x/guihua.lua', { ['do'] = 'cd lua/fzy && make' }},
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'tpope/vim-commentary',
    'vim-scripts/CursorLineCurrentWindow',
    'junegunn/vim-easy-align',
    'AndrewRadev/splitjoin.vim',
    'vim-utils/vim-man',
    'adelarsq/vim-matchit',
    'tiagovla/scope.nvim', -- " Make buffers scoped to tab page
    'tpope/vim-surround',
    'windwp/nvim-autopairs', -- " Auto close quotes and other pairs
    'abecodes/tabout.nvim',
    'kylechui/nvim-surround', -- " Change surrodings on fly
    'gcmt/wildfire.vim', -- " Cycle thought text objects
    'jinh0/eyeliner.nvim', -- " Move faster with unique f/F indicators for each word on the line.
    'folke/which-key.nvim', -- " Display key definitions in cool menu
    'mbbill/undotree', -- undo explorer
    'gbprod/yanky.nvim', -- yank explorer
    'simeji/winresizer', -- " Resize windows with ctrl+e
    'AndrewRadev/linediff.vim', -- " Diff between lines
    { 'L3MON4D3/LuaSnip', { tag = 'v2.*', ['do'] = 'make install_jsregexp'}}, -- " Snippets
    'rafamadriz/friendly-snippets',
    'dhruvasagar/vim-table-mode', -- " Table-mode support
    'folke/neodev.nvim', -- " Vim development
    {
      search_tools = {
        'jremmen/vim-ripgrep',
        'eugen0329/vim-esearch',
        'romainl/vim-cool',
      }
    },
    {
      ui = {
        'kevinhwang91/nvim-bqf',
        'goolord/alpha-nvim', -- " Starup dashboard
        'nvim-lualine/lualine.nvim', -- " Statusline
        'seblj/nvim-tabline', -- " Tabs
        'lewis6991/hover.nvim', -- LSP doc on hover
        'scrooloose/nerdtree', -- Sidebar filemanagers
        'nvim-neo-tree/neo-tree.nvim',
        'wfxr/minimap.vim', -- " Code minimap
        'j-hui/fidget.nvim', -- " Notifications
        { 'folke/trouble.nvim', { branch = 'main' }}, -- " Get list of all troubles
        'dgagn/diagflow.nvim', -- " LSP diagnostics in virtual text at the top right of your screen
        'stevearc/overseer.nvim', -- " Command runner with ui
        'SmiteshP/nvim-navic'
      }
    },
    {
      git = {
        'tpope/vim-fugitive',
        'lewis6991/gitsigns.nvim',
      }
    },
    {
      tests = {
        'tpope/vim-dispatch',
        'janko-m/vim-test',
        'nvim-neotest/nvim-nio',
        'nvim-neotest/neotest',
        'olimorris/neotest-rspec',
      }
    },
    {
      ctags = {
        'ludovicchabant/vim-gutentags',
        'majutsushi/tagbar',
      }
    },
    {
      fzf = {
        '/opt/homebrew/opt/fzf',
        'junegunn/fzf.vim',
      }
    },
    {
      languages = {
        'tpope/vim-rbenv',
        'vim-ruby/vim-ruby',
        'tpope/vim-rails',
        'tpope/vim-bundler',
        'tpope/vim-endwise',
        'tpope/vim-haml',
        'plasticboy/vim-markdown',
        'jelera/vim-javascript-syntax',
        'pangloss/vim-javascript',
        'MaxMEllon/vim-jsx-pretty',
        -- 'othree/javascript-libraries-syntax.vim',
        'mitsuhiko/jinja2',
        'leafgarland/typescript-vim',
        'peitalin/vim-jsx-typescript',
        'elixir-editors/vim-elixir',
        'slashmili/alchemist.vim',
        'racer-rust/vim-racer',
        'rust-lang/rust.vim',
        'lepture/vim-jinja',
        'ap/vim-css-color',
        'pearofducks/ansible-vim',
        'ekalinin/Dockerfile.vim',
        'chr4/nginx.vim',
        'slim-template/vim-slim',

        -- " Lsp & tree-sitter support
        'nvim-tree/nvim-web-devicons',

        'ray-x/go.nvim', -- " Golang support
        'mfussenegger/nvim-lint'
      }
    },
    {
      colorschemes = {
        'rktjmp/lush.nvim',
        { 'ChrisKempson/Tomorrow-Theme', { rtp = 'vim' }},

        'davidosomething/vim-colors-meh',
        'kkga/vim-envy',

        'navarasu/onedark.nvim',

        -- " 'RRethy/nvim-base16'
        --
        'projekt0n/github-nvim-theme',
        'savq/melange-nvim',

        { 'rockyzhang24/arctic.nvim', { branch = 'v2' }},

        'Mofiqul/adwaita.nvim',

        'yorik1984/newpaper.nvim',
        'oneslash/helix-nvim',
        'Verf/deepwhite.nvim',

        -- new
        'jacoborus/tender.vim',
        'bartekprtc/distinct.nvim',
        'uloco/bluloco.nvim',
        'timofurrer/edelweiss',
        'alexblackie/lunarised',
        'MetriC-DT/balance-theme.nvim',
        'slugbyte/lackluster.nvim',
        'deparr/tairiki.nvim',
        'lunacookies/vim-colors-xcode'
      }
    },
    {
      in_development = {
        'pechorin/any-jump.vim',
        'pechorin/u-keymapper.vim',
        'pechorin/vim-leuven-theme',
      }
    },
  },

  keymaps = {
    { 'n', ';', ':', { desc = "remap ; to :" }},
    { 'v', '//', "y/V<C-R>=escape(@\",'/\')<CR><CR>", { desc = "Search visual selected text via //", noremap = true }},

    -- quickfix
    { 'n', '<Leader>co', ':copen<CR>', { desc = "Show quickfix", noremap = true }},
    { 'n', '<Leader>cc', ':cclose<CR>', { desc = "Hide quickfix", noremap = true }},

    -- Cycle through text objects
    { 'n', '<SPACE>', '<Plug>(wildfire-fuel)', { desc = "This selects the next closest text object" }},
    { 'v', '<C-SPACE>', '<Plug>(wildfire-water)', { desc = "This selects the previous closest text object"}},

    -- Minimap
    { 'n', '<leader>l', ':MinimapToggle<CR>', { desc = "Toggle minimap"}},

    { 'n', 'Q', '<Nop>', { desc = 'disable ex mode' }},
    { 'n', 'K', '<Nop>', { desc = 'disable default K' }},

    -- Don't skip wrap lines
    { '', 'j', 'gj', { noremap = true }},
    { '', 'k', 'gk', { noremap = true }},

    navigation = {
      -- Tabs
      { 'n', '<leader>t', ':tabnew<CR>' },
      { 'n', 'T', ':tabnew<CR>' },
      { 'n', 'Q', ':tabclose<CR>' },
      { 'n', '<S-Right>', ':tabnext<CR>' },
      { 'n', '<S-Left>',  ':tabprevious<CR>' },
      -- { 'n', 'bd', ':bdelete<cr>', { desc = "Delete buffer" }},

      -- Buffers
      { 'n', '<leader>x', '<cmd>bp|bd#<CR>', { desc = "Kill current buffer", remap = true }},
      { 'n', '<S-Up>', ':bnext<cr>', { desc = "Next buffer" }},
      { 'n', '<S-Down>', ':bprevious<cr>', { desc = "Prev buffer" }},

      -- { 'n', '<leader>et', ':Outline<CR>', { desc = "Lsp symbols panel with outline.nvim" }},
      { 'n', '<leader>n',  ':NERDTree<CR>',   { desc = "NERDTree for project" }},
      { 'n', '<leader>N',  ':NERDTree %<CR>', { desc = "NERDTree for current file" }},

      -- Neotree
      { 'n', '<leader>m',  ':Neotree<CR>',                  { desc = "Neotree" }},
      { 'n', '<leader>M',  ':Neotree %<CR>',                { desc = "Neotree for current file" }},
      { 'n', '<leader>,',  ':Neotree buffers<CR>',          { desc = "Neotree buffers" }},
      { 'n', '<leader>.',  ':Neotree float git_status<CR>', { desc = "Neotree git" }},

      -- run AnyJump on ctrl+click
      { 'n', '<C-LeftMouse>', ':AnyJump<CR>', { desc = "Run AnyJump on ctrl+click", noremap = true }},
    },
    bask_like_keys_for_cmd = {
      { 'c', '<C-A>', '<Home>', { desc = 'Bash-like CTRL+A for terminal mode', noremap = true }},
      { 'c', '<C-E>', '<End>',  { desc = 'Bash-like CTRL+E for terminal mode', noremap = true }},
      { 'c', '<C-K>', '<C-U>',  { desc = 'Bash-like CTRL+K for terminal mode', noremap = true }},
    },
    text_manipulation = {
      { 'x', 'ga', '<Plug>(EasyAlign)', { desc = 'Align in visual mode (e.g. `vipga`)' }},
      { 'n', 'ga', '<Plug>(EasyAlign)', { desc = 'Align for a motion/text object (e.g. `gaip`)' }},
    },
    commenting = {
      { 'n', '<leader>c', '<Plug>CommentaryLine', { desc = "Comment current line" }},
      { 'v', '<leader>c', '<Plug>Commentary',     { desc = "Comment visualy selected text" }},
    },
    fzf = {
      { 'n', '<leader>b', ':Buffers<CR>', { desc = "fzf Buffers"}},
      { 'n', '<leader>q', ':Files<CR>',   { desc = "fzf Project files"}},
    },
    vimscript = {
      { 'n', '<leader>ec', ':Color <CR>',                  { desc = "fzf colorschemes select"}},
      { 'n', '<leader>ee', ':so %<CR>',                    { desc = "(vimrc) Eval current file as vimscript"}},
      { 'n', '<leader>eb', ':e ~/vim-files/init.lua <CR>', { desc = "(init.lua) Open init.lua in current buffer"}},
      { 'n', '<leader>ei', ':e ~/.vimrc <CR>',             { desc = "(vimrc) Open $MYVIMRC in current buffer"}},
    },
    git = {
      { 'n', '<leader>gg', ':tab Git<CR>',   { desc = "Open Git in new tab"}},
      { 'n', '<leader>gG', ':Git<CR>',       { desc = "Open Git in split"}},
      { 'n', '<leader>gb', ':Git blame<CR>', { desc = "Git blame for file"}},
    },
    osx_clipboard = {
      { '', '<leader>y', '"*y', { desc = 'Copy to system clipboard' }},
      { '', '<leader>p', '"*p', { desc = 'Paste from system clipboard' }},
      { '', '<leader>Y', '"+y', { desc = 'Copy to editor clipboard' }},
      { '', '<leader>P', '"+p', { desc = 'Paste from editor clipboard' }},
    },
    neotest_runners = {
      { 'n', '<leader>rf', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>',      { noremap = true, desc = "Neotest current file", silent = true }},
      { 'n', '<leader>rn', ':lua require("neotest").run.run()<CR>',                        { noremap = true, desc = "Neotest nearest test suite", silent = true}},
      { 'n', '<leader>rs', ':lua require("neotest").run.stop()<CR>',                       { noremap = true, silent = true}},
      { 'n', '<leader>ra', ':lua require("neotest").run.attach()<CR>',                     { noremap = true, silent = true}},
      { 'n', '<leader>rw', ':lua require("neotest").watch.toggle(vim.fn.expand("%"))<CR>', { noremap = true, desc = "Neotest watch current file", silent = true}},
      { 'n', '<leader>ro', ':lua require("neotest").output.toggle({ enter = true })<CR>',  { noremap = true, desc = "Neotest toggle output panel", silent = true}},
    },
    classic_test_runners = {
      { 'n', '<silent>', '<leader>rtf :TestFile<CR>' },
      { 'n', '<silent>', '<leader>rtd :TestFile -f d<CR>' },
      { 'n', '<silent>', '<leader>rtn :TestNearest<CR>' },
      { 'n', '<silent>', '<leader>rts :TestSuite<CR>' },
      { 'n', '<silent>', '<leader>rtl :TestLast<CR>' },
    },
    terminal = {
      -- " tnoremap <Esc> <C-\><C-n> "Exit to normal mode from terminal with esc"

      -- " make C-w C-w works in term
      { 't', '<C-w>', '<C-><C-o><C-w>', { remap = true, desc = "Make C-w C-w works in term" }},
    },
  },

  autocommands = {
    { event = { 'BufNewFile', 'BufRead' }, pattern = '*', command = "let b:preferred_searcher = 'rg'" },
    { event = { 'BufWritePre' }, pattern = '*', command = ":%s/\\s\\+$//e" },
    language_detection = {
      { event = { 'BufNewFile' , 'BufRead' }, pattern = '*.rs',     command = 'set filetype=rust' },
      { event = { 'BufNewFile' , 'BufRead' }, pattern = '*.yml.j2', command = 'set filetype=yaml' },
      { event = { 'BufNewFile' , 'BufRead' }, pattern = '*.pcss ',  command = 'set filetype=postcss' },
      { event = { 'BufNewFile' , 'BufRead' }, pattern = '*.arb',    command = 'set filetype=ruby' },
      { event = { 'BufNewFile' , 'BufRead' }, pattern = '*.lmx',    command = 'set filetype=haml' },

      -- for alternative Gemfiles
      { event = { 'BufNewFile' , 'BufRead' }, pattern = 'Gemfile*', command = 'set filetype=ruby' },
    },
    languages_settings = {
      -- pretty colymn hi for yaml modes
      { event = { 'FileType' }, pattern = 'yaml',       command = 'setlocal cursorcolumn' },
      { event = { 'FileType' }, pattern = 'eruby.yaml', command = 'setlocal cursorcolumn' },

      -- js with 2 tabs
      { event = { 'FileType' }, pattern = 'javascript', command = 'setlocal sw=2 sw=2 sts=2' },
    },
    reload_buffer_if_file_changed = {
      {
        pattern = '*',
        command = 'checktime',
        event = {
          'BufEnter', 'WinLeave',
          'CursorHold', 'CursorHoldI', 'CursorMoved', 'CursorMovedI',
          'FocusGained', 'FocusLost'
        }
      },
    },
    -- auto_remove_trailing_whitespaces = {
    --   { event = { 'BufWritePre' }, pattern = '*', command = ":%s/\\s\\+$//e" },
    -- },
    terminal_settings = {
      { event = { 'BufWinEnter' }, pattern = 'term://*', command = 'startinsert' },
      -- { event = { 'WinEnter' }, pattern = 'term://*'', command = 'startinsert' },
      { event = { 'BufLeave' }, pattern = 'term://*', command = 'stopinsert' },
    },
  },

  vim_globals = {
    mapleader = ',',
    fzf_preview_window    = '',
    ['$FZF_DEFAULT_OPTS'] = '--layout=reverse --multi',
    fzf_layout            = { window = { width = 0.9, height = 0.6, border = 'sharp' } },
    -- fzf_colors            = {
    --   fg      = { 'fg', 'Normal' },
    --   bg      = { 'bg', 'Normal' },
    --   hl      = { 'fg', 'Comment' },
    --   ['fg+'] = { 'fg', 'CursorLine', 'CursorColumn', 'Normal' },
    --   ['bg+'] = { 'bg', 'CursorLine', 'CursorColumn' },
    --   ['hl+'] = { 'fg', 'Statement' },
    --   info    = { 'fg', 'PreProc' },
    --   border  = { 'fg', 'Ignore' },
    --   prompt  = { 'fg', 'Conditional' },
    --   pointer = { 'fg', 'Exception' },
    --   marker  = { 'fg', 'Keyword' },
    --   spinner = { 'fg', 'Label' },
    --   header  = { 'fg', 'Comment' }
    -- },

    -- NERDtree (classic tree explorer)
    NERDTreeShowHidden = 1,
    NERDTreeMinimalUI  = 1, -- Disables display of the 'Bookmarks' label and 'Press ? for help' text.
    NERDTreeDirArrows  = 0, -- Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.
    NERDTreeIgnore     = { '.git$' },
    NERDTreeStatusline = 0,
    NERDTreeWinSize    = 25,

    -- javascript-libraries-syntax.vim
    -- used_javascript_libs = { 'underscore', 'backbone', 'angularjs'},

    -- markdown
    vim_markdown_folding_disabled = 1,

    -- vim-test
    ['test#strategy']             = 'neovim',
    ['test#neovim#term_position'] = 'rightbelow 25',
    ['test#preserve_screen']      = 1,
    ['test#neovim#start_normal']  = 1,
    ['test#ruby#rspec#options']   = { file = '--format documentation' },

    -- ~ ruby
    ruby_path             = function() return vim.fn.system('rbenv prefix') end,
    ruby_host_prog        = function() return vim.fn.substitute(vim.fn.system('rbenv prefix') .. '/bin/ruby', "\n", '', 'g') end,
    ruby_operators        = 1,
    ruby_pseudo_operators = 1,
    ruby_no_expensive     = 1,

    -- Esearch
    sort_by_path = {adapters = {rg = {options = '--sort path'}}},
    sort_by_date = {adapters = {rg = {options = '--sort modified'}}},
    -- esearch = {
    --   win_new = function(esearch)
    --     return vim.fn['esearch#buf#goto_or_open'](esearch.name, 'new')
    --   end
    -- },
    esearch = {
      prefill = {'last', 'clipboard'},
      live_update = true,
      win_map = {
        {'n', 'gq',  ':call esearch#init(extend(copy(b:esearch), {"out": "qflist"}))<cr>'  },
        {'n', 'gsp', ':call esearch#init(extend(b:esearch, sort_by_path))<cr>'             },
        {'n', 'gsd', ':call esearch#init(extend(b:esearch, sort_by_date))<cr>'             },
      }
    },

    -- NOTE: {'backend': 'system'} means synchronous reload using system() call to stay within the same context
    -- ['AddAfter'] = { n = { after = b:esearch.after + n, 'backend': 'system'}}, -- TODO: recheck

    -- any-jump.vim config
    any_jump_search_prefered_engine = 'rg',
    any_jump_ignored_files          = {'*.tmp', '*.temp', 'tags'},

    -- ctags
    gutentags_define_advanced_commands = 1,
    gutentags_ctags_exclude            = {'*.js', '*.jsx', '*.coffee', '*.js.erb', 'node_modules'},
    gutentags_file_list_command = 'rg --files',

    -- hi MsgSeparator guifg=#ff00ff

    -- vim-table-mode
    table_mode_corner='|',

    -- onedark theme config
    onedark_config = { style = 'warmer' },

    -- nvim-cursorword
    -- hi default CursorWord cterm=underline gui=underline
    -- hi default CursorWord cterm=underline guifg=#ff00ff

    -- minimap
    minimap_git_colors = true,

    -- winresize
    winresizer_vert_resize = 25,
    winresizer_horiz_resize = 5,
  },

  setup = function()
    require("which-key").setup({})
    require("nvim-autopairs").setup({})
    require("nvim-surround").setup({})
    require('overseer').setup({})
    require("scope").setup({})
    require("yanky").setup({})
    require("fidget").setup({})
    require("trouble").setup({})
    require('neotest').setup({ adapters = { require('neotest-rspec'), } })
    require('diagflow').setup({ padding_top = 5, text_align = 'left' })

    -- neo-tree
    require("neo-tree").setup({
      enable_git_status = true,
      window            = { width = 30 },
      default_component_configs = {
        container = { enable_character_fade = false },
        indent    = { indent_size = 1, padding = 0, with_markers = false, },
        icon      = { folder_closed = ">", folder_open = "-", folder_empty = "ﰊ", },
        modified  = { symbol = "[+]" }
      },
      filesystem = {
        filtered_items = {
          visible         = false,
          hide_dotfiles   = false,
          hide_gitignored = false,
          hide_by_name    = { "node_modules", "tags", },
          never_show      = { ".DS_Store" }
        },
        follow_current_file  = { enabled = true }, use_libuv_file_watcher = true,
      },
      source_selector = {
        winbar = true,
        sources = {
          { source = "filesystem" },
          { source = "buffers" },
          { source = "git_status" },
          { source = "document_symbols" },
        },
      },
      sources = { "filesystem", "buffers", "git_status", "document_symbols" }
    })

    require('eyeliner').setup({
      highlight_on_key = true, -- show highlights only after keypress
      dim = false              -- dim all other characters if set to true (recommended!)
    })

    -- git markers
    require('gitsigns').setup({
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true, virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000, ignore_whitespace = false, virt_text_priority = 100,
      },
    })

    -- tabline
    require('tabline').setup({
        no_name         = '[new]',
        modified_icon   = '',
        close_icon      = '',
        -- separator    = "▌",
        separator       = "|",
        padding         = 1,
        color_all_icons = true,
        right_separator = true,
        show_index      = false,
        show_icon       = true,
    })

    -- tabout
    require('tabout').setup({
      tabkey            = '<Tab>', -- key to trigger tabout, set to an empty string to disable
      backwards_tabkey  = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
      act_as_tab        = true, -- shift content if tab out is not possible
      act_as_shift_tab  = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
      default_tab       = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
      default_shift_tab = '<C-d>', -- reverse shift default action,
      enable_backwards  = true, -- well ...
      completion        = true, -- if the tabkey is used in a completion pum
      tabouts = {
        {open = "'", close = "'"},
        {open = '"', close = '"'},
        {open = '`', close = '`'},
        {open = '(', close = ')'},
        {open = '[', close = ']'},
        {open = '{', close = '}'}
      },
      ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
      exclude          = {} -- tabout will ignore these filetypes
    })

    -- lualine
    local gps = require("nvim-gps")
    gps.setup()

    local treesitter = require('nvim-treesitter')

    -- local current_treesitter_context = function()
    --   if not packer_plugins["nvim-treesitter"] or packer_plugins["nvim-treesitter"].loaded == false then
    --     return " "
    --   end
    --   local f = require'nvim-treesitter'.statusline({
    --     indicator_size = 300,
    --     type_patterns = {"class", "function", "method", "interface", "type_spec", "table", "if_statement", "for_statement", "for_in_statement"}
    --   })
    --   local fun_name = string.format("%s", f) -- convert to string, it may be a empty ts node

    --   -- print(string.find(fun_name, "vim.NIL"))
    --   if fun_name == "vim.NIL" then
    --     return " "
    --   end
    --   return " " .. fun_name
    -- end

    require('lualine').setup({
      options = {
        theme              = 'auto',
        globalstatus       = true,
        refresh            = { statusline = 3000, tabline = 3000, winba = 3000 },
        section_separators = '', component_separators = '',
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        disabled_filetypes = { winbar = { 'nerdtree', 'neo-tree' , 'alpha', 'fugitive', '', 'esearch'} },
      },
      sections = {
        lualine_a = {
          { 'mode', fmt = function(str) return str:sub(1,1) end, padding = 1 },
        },
        lualine_b = {'branch', 'diff'},
        lualine_c = {
          { treesitter.statusline }
        },
        lualine_x = {
          -- { 'filename', path = 1, newfile_status = true },
          'fileformat', 'encoding', 'filetype', 'diagnostics',
        },
        lualine_y = {'progress'},
        lualine_z = {'location', 'searchcount', 'selectioncount'},
      },
      -- tabline = {
      --   lualine_a = {
      --     {
      --       'tabs',
      --       mode = 1,
      --       path = 1,
      --       use_mode_colors = true
      --     }
      --   },
      --   -- lualine_b = {
      --   --   { 'buffers' }
      --   -- },
      -- },
      winbar = {
        lualine_a = {
          {
            'navic',
            color_correction = 'dynamic',
            navic_opts = {
              highlight = true,
              click = true,
              separator = '  '
            }
          },
        },
        lualine_z = {
          { 'filename', path = 1, newfile_status = true },
        }
      },
      inactive_winbar = {
        lualine_z = {
          { 'filename', path = 1, newfile_status = true }
        }
      },
      extensions = {'quickfix', 'fzf', 'nerdtree', 'neo-tree', 'fugitive', 'man', 'trouble'}
    })

    -- quickfix
    vim.cmd [[
      packadd cfilter
    ]]

    -- do not hl cursor in term
    vim.cmd [[
      hi CursorLine cterm=NONE
    ]]

    -- zsh
    vim.opt.shell = '/bin/zsh -l'

    -- fzf
    vim.cmd [[
      set rtp+=/usr/local/opt/fzf
    ]]

    -- ripgrep
    vim.opt.grepprg = 'rg --color=never'
  end,

  packs = {
    telescope = {
      vim_plug_bundle = {
        { 'nvim-telescope/telescope.nvim', { branch = '0.1.x' }},
        'andrew-george/telescope-themes',
        'otavioschwanck/telescope-alternate',
        'isak102/telescope-git-file-history.nvim',
        'FabianWirth/search.nvim',
      },
      keymaps = {
        { 'n', '<Leader>gS', ":lua require('search').open()<CR>", { desc = "Run search window", noremap = true }},
        { 'n', '<leader>gT', '<cmd>Telescope<cr>',             { noremap = true, desc = "Telescope" }},
        { 'n', '<leader>gf', '<cmd>Telescope find_files<cr>',  { noremap = true, desc = "Files" }},
        { 'n', '<leader>gb', '<cmd>Telescope buffers<cr>',     { noremap = true, desc = "Buffers" }},
        { 'n', '<leader>gl', '<cmd>Telescope oldfiles<cr>',    { noremap = true, desc = "Old files" }},
        { 'n', '<leader>gc', '<cmd>Telescope themes<cr>',      { noremap = true, desc = "Themes" }},
        { 'n', '<leader>gk', '<cmd>Telescope keymaps<cr>',     { noremap = true, desc = "Keys" }},
        { 'n', '<leader>gh', '<cmd>Telescope git_commits<cr>', { noremap = true, desc = "Git commits" }},
        { 'n', '<leader>gs', '<cmd>Telescope git_status<cr>',  { noremap = true, desc = "Git status" }},
        { 'n', '<leader>gr', '<cmd>Telescope registers<cr>',   { noremap = true, desc = "Keys" }},
        { 'n', '<leader>gd', '<cmd>Telescope diagnostics<cr>', { noremap = true, desc = "Keys" }},
        { 'n', '<leader>ga', '<cmd>Telescope telescope-alternate alternate_file<cr>', { noremap = true, desc = "Keys" }},
      },
      setup = function(self)
        local telescope     = require('telescope')
        local actions       = require("telescope.actions")
        local action_layout = require("telescope.actions.layout")

        require('search').setup({})

        telescope.setup({
          defaults = {
            layout_config = { vertical = { width = 0.6 }, horizontal = { width = 0.5 } },
            mappings = {
              i = {
                ["<esc>"] = actions.close,
              },
            },
          },
          pickers = {
            buffers = { theme = "dropdown" }, find_files = { theme = "dropdown" }
          },
          extensions = {
            themes = {
              enable_previewer = false, enable_live_preview = true, persist = { enabled = false }, ignore = {},
              layout_config = { horizontal = { width = 0.3, height = 0.5 } },
            },
            -- TODO: setup: https://github.com/otavioschwanck/telescope-alternate.nvim
            ["telescope-alternate"] = {
             presets = { 'rails', 'rspec' },
             mappings = {
               { 'app/models/(.*).rb', {
                 { 'app/admin/**/*[1].rb', 'Admin' },
                 { 'app/interactions/[1:pluralize]*/*.rb', 'Interactions' },
                 { 'app/interactors/[1:pluralize]*/*.rb', 'Interactors' },
                 -- { 'app/**/[1:pluralize]/*.rb', 'Modules' },
                 -- { 'app/**/**/[1]*.rb', '~*' },
               }
               },
               -- { 'app/services/(.*)/(.*).rb', { -- alternate from services to contracts / models
            -- --      -- { 'app/contracts/[1]_contracts/[2].rb', 'Contract' }, -- Adding label to switch
               --   { 'app/models/**/*[1].rb', 'Model' },
               --   { 'app/interactions/**/*[1].rb', 'Interactions' },
               --   { 'app/interactors/**/*[1].rb', 'Interactors' },
               -- } },
            --    { 'app/contracts/(.*)_contracts/(.*).rb', { { 'app/services/[1]_services/[2].rb', 'Service' } } }, -- from contracts to services
            --    -- Search anything on helper folder that contains pluralize version of model.
            --    --Example: app/models/user.rb -> app/helpers/foo/bar/my_users_helper.rb
            --    { 'app/models/(.*).rb', { { 'db/helpers/**/*[1:pluralize]*.rb', 'Helper' } } },
               -- { 'app/**/*.rb', { { 'spec/[1].rb', 'Test' } } }, -- Alternate between file and test
             },
            },
          }
        })

        telescope.load_extension('themes')
        telescope.load_extension('telescope-alternate')
        telescope.load_extension('git_file_history')
      end
    },
    nvim_lint = {
      vim_plug_bundle = {
        'mfussenegger/nvim-lint' -- " TODO: use lsp linter support?
      },
      setup = function(self)
        if type(self.settings.nvim_lint) == 'table' then
          if type(self.settings.nvim_lint.linters_by_ft) == 'table' then
            require('lint').linters_by_ft = self.settings.nvim_lint.linters_by_ft

            local pattern = self.settings.nvim_lint.file_pattern or { "*.rb", "*.erb", "*.haml", "*.slim" }

            vim.api.nvim_create_autocmd({ "BufWritePost", "BufRead" }, {
              pattern = pattern,
              callback = function()
                require("lint").try_lint()
              end,
            })
          end
        end
      end,
    },
    nvim_treesitter = {
      vim_plug_bundle = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-treesitter/playground',
        'SmiteshP/nvim-gps'
      },
      setup = function(self)
        if type(self.settings.nvim_treesitter) ~= 'table' or type(self.settings.nvim_treesitter.languages) ~= 'table' then return end

        require('nvim-treesitter.configs').setup {
          ensure_installed = self.settings.nvim_treesitter.languages,
          sync_install     = true,
          auto_install     = true,
          highlight        = { enable = true }
        }
      end
    },
    alpha_start_dashboard = {
      vim_plug_bundle = {
        'goolord/alpha-nvim'
      },
      autocommands = {
        -- Disable folding on alpha buffer
        { event = { 'FileType' }, pattern = 'alpha', command = 'setlocal nofoldenable' },
      },
      setup = function(self)
        local alpha = require("alpha")
        local startify = require("alpha.themes.startify")

        local title = self.settings.alpha_start_dashboard.title or 'Hello world'

        startify.section.header.val = { title }

        startify.opts.layout[1].val = 2
        startify.opts.opts.margin   = 3

        -- disable MRU
        startify.section.mru.val = { { type = "padding", val = 0 } }

        local buttons = {}

        for _, data in pairs(self.settings.alpha_start_dashboard.buttons or {}) do
          local btn = startify.button(unpack(data))
          table.insert(buttons, btn)
        end

        startify.section.top_buttons.val = buttons

        -- Send config to alpha
        alpha.setup(startify.config)
      end
    }
  }, -- packs
}
