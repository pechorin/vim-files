" = Init Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/bundle')

" Common plugins
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/CursorLineCurrentWindow'
Plug 'tpope/vim-surround'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'vim-utils/vim-man'
Plug 'adelarsq/vim-matchit'

" Resize windows with ctrl+e
Plug 'simeji/winresizer'

" Diff between lines
Plug 'AndrewRadev/linediff.vim'

" Searching
Plug 'eugen0329/vim-esearch'
Plug 'romainl/vim-cool'

" Git support
Plug 'tpope/vim-fugitive'

" Tests
Plug 'tpope/vim-dispatch'
Plug 'janko-m/vim-test'

" CTags support
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" Fuzzy engine for fast selection menus
Plug '/opt/homebrew/opt/fzf'
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
Plug 'slim-template/vim-slim'

" == Colorschemes
Plug 'ChrisKempson/Tomorrow-Theme', { 'rtp' : 'vim' }
Plug 'davidosomething/vim-colors-meh'
Plug 'kkga/vim-envy'

" == In development plugins
Plug 'pechorin/any-jump.vim'
Plug 'pechorin/u-keymapper.vim'
Plug 'pechorin/vim-leuven-theme'

" Plug '~/work/any-jump.vim'
" Plug '~/work/u-keymapper.vim'

" Cycle thought text objects
Plug 'gcmt/wildfire.vim'

if has('nvim')
  " General toolkits
  Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
  Plug 'nvim-lua/plenary.nvim'               " utilities
  Plug 'MunifTanjim/nui.nvim'                " lua ui

  " Tabs
  Plug 'seblj/nvim-tabline'

  " Make buffers scoped to tab page
  Plug 'tiagovla/scope.nvim'

  " History explorers
  Plug 'mbbill/undotree'
  Plug 'gbprod/yanky.nvim'

  " Auto close quotes and other pairs
  Plug 'windwp/nvim-autopairs'

  " Change surrodings on fly
  Plug 'kylechui/nvim-surround'

  " Move faster with unique f/F indicators for each word on the line.
  Plug 'jinh0/eyeliner.nvim'

  " Display key definitions in cool menu
  Plug 'folke/which-key.nvim'

  " Statusline
  Plug 'nvim-lualine/lualine.nvim'

  " Modern nerdtree
  Plug 'nvim-neo-tree/neo-tree.nvim'

  " Git signs
  Plug 'lewis6991/gitsigns.nvim'

  " Code minimap
  Plug 'wfxr/minimap.vim'

  " Notifications
  Plug 'j-hui/fidget.nvim'

  " Telescope
  Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
  Plug 'andrew-george/telescope-themes'
  Plug 'otavioschwanck/telescope-alternate'
  Plug 'FabianWirth/search.nvim'
  Plug 'isak102/telescope-git-file-history.nvim'

  " Get list of all troubles
  Plug 'folke/trouble.nvim', { 'branch': 'main' }

  " Vim development
  Plug 'folke/neodev.nvim'

  " Lsp & tree-sitter support
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'nvim-treesitter/playground'
  " Plug 'neovim/nvim-lsp'
  " Plug 'ray-x/lsp_signature.nvim'
  Plug 'neovim/nvim-lspconfig'
  " Plug 'folke/lsp-colors.nvim'
  Plug 'onsails/lspkind.nvim'
  Plug 'zeioth/garbage-day.nvim'
  Plug 'lewis6991/hover.nvim'
  Plug 'hedyhli/outline.nvim'
  Plug 'Bekaboo/dropbar.nvim'

  " Golang support
  Plug 'ray-x/go.nvim'

  " display colors inline
  " archived
  " Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

  " Starup dashboard
  Plug 'goolord/alpha-nvim'

  " Snippets
  Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
  Plug 'rafamadriz/friendly-snippets'

  " Code completion
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
  Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
  Plug 'quangnguyen30192/cmp-nvim-tags'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'ray-x/cmp-treesitter'
  Plug 'hrsh7th/cmp-omni'
  Plug 'saadparwaiz1/cmp_luasnip'

  " Tab button
  Plug 'abecodes/tabout.nvim'

  " Testing utils
  Plug 'nvim-neotest/nvim-nio'
  Plug 'nvim-neotest/neotest'
  Plug 'olimorris/neotest-rspec'

  " Command runner with ui
  Plug 'stevearc/overseer.nvim'

  " LSP diagnostics in virtual text at the top right of your screen
  Plug 'dgagn/diagflow.nvim'

  " Run linters
  Plug 'mfussenegger/nvim-lint'

  " Nvim colorschemes
  Plug 'rktjmp/lush.nvim'
  Plug 'navarasu/onedark.nvim'
  " Plug 'RRethy/nvim-base16'
  Plug 'projekt0n/github-nvim-theme'
  Plug 'savq/melange-nvim'
  Plug 'rockyzhang24/arctic.nvim', { 'branch': 'v2' }
  Plug 'Mofiqul/adwaita.nvim'
  Plug 'yorik1984/newpaper.nvim'
  Plug 'oneslash/helix-nvim'
  Plug 'Verf/deepwhite.nvim'
end

call plug#end()
