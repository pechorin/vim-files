" filetype off

call plug#begin('~/.vim/bundle')

" -- general vim libs --
Plug 'ray-x/guihua.lua', { 'do': 'cd lua/fzy && make' }
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'folke/neodev.nvim'  " Vim development

" -- editor --
Plug 'tiagovla/scope.nvim'           " Make buffers scoped to tab page
Plug 'folke/which-key.nvim'          " Display key definitions in cool menu
Plug 'simeji/winresizer'             " Resize windows with ctrl+e
Plug 'AndrewRadev/linediff.vim'      " Diff between lines
Plug 'folke/noice.nvim'              " UI features like custom pop cmdline
Plug 'rachartier/tiny-glimmer.nvim'  " Visual effects
Plug 'luiscassih/AniMotion.nvim'     " Motions like in helix

" -- editing --
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/CursorLineCurrentWindow'
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'gcmt/wildfire.vim'           " Cycle thought text objects
Plug 'jinh0/eyeliner.nvim'         " Move faster with unique f/F indicators for each word on the line.
Plug 'dhruvasagar/vim-table-mode'  " Table-mode support
Plug 'abecodes/tabout.nvim'

" -- tree-sitter --
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
Plug 'SmiteshP/nvim-gps'

" -- lsp --
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind.nvim'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'zeioth/garbage-day.nvim' " stop inactive lsp servers
Plug 'Wansmer/symbol-usage.nvim'

" -- code completion --
Plug 'iguanacucumber/magazine.nvim', { 'as': 'nvim-cmp' }
Plug 'iguanacucumber/mag-nvim-lsp', { 'as': 'cmp-nvim-lsp' }
Plug 'iguanacucumber/mag-buffer', { 'as': 'cmp-buffer' }
Plug 'iguanacucumber/mag-cmdline', { 'as': 'cmp-cmdline' }

Plug 'https://codeberg.org/FelipeLema/cmp-async-path'
Plug 'hrsh7th/cmp-path'

Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
Plug 'ray-x/lsp_signature.nvim'
Plug 'quangnguyen30192/cmp-nvim-tags'
Plug 'hrsh7th/cmp-omni'
" Plug 'saadparwaiz1/cmp_luasnip'

" -- snippets --
Plug 'rafamadriz/friendly-snippets'
Plug 'garymjr/nvim-snippets'

" -- pairs --
Plug 'windwp/nvim-autopairs'     " Auto close quotes and other pairs

" -- life_quality --
Plug 'mbbill/undotree'           " undo explorer

" -- search_tools --
Plug 'jremmen/vim-ripgrep'
Plug 'eugen0329/vim-esearch'
Plug 'romainl/vim-cool'
Plug 'MagicDuck/grug-far.nvim'

" -- ui --
Plug 'kevinhwang91/nvim-bqf'       " Better quickfix
Plug 'goolord/alpha-nvim'          " Starup dashboard
Plug 'nvim-lualine/lualine.nvim'   " Statusline
Plug 'nanozuki/tabby.nvim'         " Custom tabline
Plug 'lewis6991/hover.nvim'        " LSP doc on hover
Plug 'scrooloose/nerdtree'         " Sidebar filemanagers
Plug 'nvim-neo-tree/neo-tree.nvim' " Modern file tree
Plug 'j-hui/fidget.nvim'           " Notifications
Plug 'dgagn/diagflow.nvim'         " LSP diagnostics in virtual text at the top right of your screen
Plug 'stevearc/overseer.nvim'      " Command runner with ui
Plug 'SmiteshP/nvim-navic'         " Show lsp path in window header
Plug 'petertriho/nvim-scrollbar'   " Custom scrollbar

" -- start dashboard --
Plug 'goolord/alpha-nvim'

" -- git --
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" -- tests --
Plug 'tpope/vim-dispatch'
Plug 'janko-m/vim-test'
Plug 'nvim-neotest/nvim-nio'
Plug 'nvim-neotest/neotest'
Plug 'olimorris/neotest-rspec'

" -- ctags --
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" -- fzf --
Plug '/opt/homebrew/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

Plug 'ibhagwan/fzf-lua'

" -- languages --
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
Plug 'slim-template/vim-slim'
Plug 'vim-utils/vim-man'

" -- Lsp & tree-sitter support --
Plug 'nvim-tree/nvim-web-devicons'

" -- Golang support --
Plug 'ray-x/go.nvim'

" TODO move to group
Plug 'mfussenegger/nvim-lint'

" -- colorschemes --
Plug 'rktjmp/lush.nvim'

Plug 'rockyzhang24/arctic.nvim', { 'branch': 'v2' }
Plug 'Mofiqul/adwaita.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'ChrisKempson/Tomorrow-Theme', { 'rtp': 'vim' }
Plug 'yorik1984/newpaper.nvim'
Plug 'oneslash/helix-nvim'
Plug 'savq/melange-nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'lunacookies/vim-colors-xcode'
Plug 'metalelf0/jellybeans-nvim'
Plug 'ilof2/posterpole.nvim'
Plug 'RRethy/nvim-base16'

" cool light themes
Plug 'Verf/deepwhite.nvim'
Plug 'MetriC-DT/balance-theme.nvim'


" minimal style themes
Plug 'kkga/vim-envy'

" -- in_development --
Plug 'pechorin/any-jump.vim'
Plug 'pechorin/u-keymapper.vim'
Plug 'pechorin/vim-leuven-theme'

" -- mini.* plugins
Plug 'echasnovski/mini.ai'       " additional text objects
Plug 'echasnovski/mini.surround' " change surroundings on fly
Plug 'echasnovski/mini.cursorword'

call plug#end()
