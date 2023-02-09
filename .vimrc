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
Plug 'slim-template/vim-slim'

" == Colorschemes
Plug 'ChrisKempson/Tomorrow-Theme', { 'rtp' : 'vim' }
Plug 'danilo-augusto/vim-afterglow'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'savq/melange-nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'elvessousa/sobrio'
Plug 'NLKNguyen/papercolor-theme'
" Plug 'gzagatti/vim-leuven-theme'
Plug '~/work/vim-leuven-theme'
Plug 'rakr/vim-one'

" == Mono contrast schemes
Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
Plug 'kkga/vim-envy'

" == In development plugins
Plug 'pechorin/any-jump.vim'
Plug 'pechorin/u-keymapper.vim'

" Plug '~/work/any-jump.vim'
" Plug '~/work/u-keymapper.vim'

" Cycle thought text objects
Plug 'gcmt/wildfire.vim'

if s:nvim
  " General toolkits
  Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
  Plug 'nvim-lua/plenary.nvim'               " utilities
  Plug 'MunifTanjim/nui.nvim'                " lua ui

  " Plugins development
  Plug 'folke/neodev.nvim'

  " Lsp & Tree-sitter support
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'nvim-treesitter/playground'
  Plug 'neovim/nvim-lsp'
  Plug 'neovim/nvim-lspconfig'
  " Plug 'ray-x/lsp_signature.nvim'
  Plug 'folke/lsp-colors.nvim'

  " Golang support
  Plug 'ray-x/go.nvim'

  " Display key definitions in cool menu
  Plug 'folke/which-key.nvim'

  " display colors inline
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

  " modern nerdtree
  Plug 'nvim-neo-tree/neo-tree.nvim'

  " open alternative file TODO: not working
  Plug 'rgroli/other.nvim'

  " A window for previewing, navigating and editing your LSP locations
  Plug 'dnlhc/glance.nvim'

  " Code completion
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
  Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
  Plug 'delphinus/cmp-ctags'
  Plug 'hrsh7th/nvim-cmp'

  " highlight the word under the cursor.
  Plug 'xiyaowong/nvim-cursorword'

  " A tree like view for symbols using lsp TODO: not working
  Plug 'simrat39/symbols-outline.nvim'

  " Auto close quotes and other pairs
  Plug 'windwp/nvim-autopairs'

  " Change surrodings on fly
  Plug 'kylechui/nvim-surround'

  " Cool sidebar
  Plug 'sidebar-nvim/sidebar.nvim'

  " Testing utils
  Plug 'nvim-neotest/neotest'
  Plug 'olimorris/neotest-rspec'

  " Move faster with unique f/F indicators for each word on the line.
  Plug 'jinh0/eyeliner.nvim'

  " Lualine
  Plug 'nvim-lualine/lualine.nvim'

  " Nvim only colorschemes
end

call plug#end()

" ~ load all config files
let s:current_script = resolve(expand('<sfile>:p'))
let s:scripts_path = substitute(s:current_script, '\.vimrc', '', '')

let base_configs = [
  \ '01_general.vim',
  \ '02_autocommands.vim',
  \ '03_mappings.vim',
  \ '04_plugins_settings.vim',
  \ ]

let lua_configs = [
  \ '04_plugins_settings.lua',
  \ '04_fzf.vim',
  \ '05_completion.lua',
  \ '06_lsp.lua',
  \ '07_glance.lua',
  \ '08_statusline.lua',
  \ ]

" load base vim settings
for config in base_configs
  let config_path = s:scripts_path . config
  exe 'source' . config_path
endfor

" load nvim only settings
if s:nvim
  for config in lua_configs
    let config_path = s:scripts_path . config
    exe 'source' . config_path
  endfor
endif

" theme options applied only on first script load
if s:profile_loads == 0
  colorscheme Tomorrow
endif

" ~ end profile loading
let s:profile_loads += 1

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
