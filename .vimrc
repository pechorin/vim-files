" = Vim/nvim setup

let s:nvim = has('nvim')

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
Plug 'AndrewRadev/linediff.vim'

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
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'ray-x/go.nvim'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'neovim/nvim-lsp'
  Plug 'neovim/nvim-lspconfig'
  " Plug 'ray-x/lsp_signature.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'folke/which-key.nvim'
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " display colors inline

  Plug 'nvim-lua/plenary.nvim'               " utilities
  Plug 'MunifTanjim/nui.nvim'                " lua ui
  Plug 'nvim-neo-tree/neo-tree.nvim'         " modern nerdtree
  Plug 'rgroli/other.nvim'                   " open alternative file

  " A window for previewing, navigating and editing your LSP locations
  Plug 'dnlhc/glance.nvim'

  " Code completion
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
  Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
  Plug 'hrsh7th/nvim-cmp'
end

call plug#end()

" ~ load all config files
let s:current_script = resolve(expand('<sfile>:p'))
let s:scripts_path = substitute(s:current_script, '\.vimrc', '', '')
" let s:configs_path = s:scripts_path . '.vim/config/'

let configs = [
  \ '01_general.vim',
  \ '02_autocommands.vim',
  \ '03_mappings.vim',
  \ '04_plugins.vim',
  \ '05_completion.vim',
  \ '06_lsp.vim'
  \ ]

for config in configs
  let config_path = s:scripts_path . config
  exec 'source' . config_path
endfor

" theme options applied only on first script load
if s:profile_loads == 0
  colorscheme Tomorrow
endif

" ~ end profile loading
let s:profile_loads += 1
