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
" Plug 'itchyny/lightline.vim'
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
  " Plug 'folke/which-key.nvim'

  " display colors inline
  " archived
  " Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

  " modern nerdtree
  Plug 'nvim-neo-tree/neo-tree.nvim'

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

  " Ui
  Plug 'nvim-lualine/lualine.nvim'

  " Command runner with ui
  Plug 'stevearc/overseer.nvim'

  Plug 'dgagn/diagflow.nvim'
  Plug 'mfussenegger/nvim-lint'

  " Nvim colorschemes
  Plug 'Mofiqul/vscode.nvim'
  Plug 'navarasu/onedark.nvim'
  Plug 'RRethy/nvim-base16'

  Plug 'wfxr/minimap.vim'

  Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
end

call plug#end()

" ~ load all config files
let s:current_script = resolve(expand('<sfile>:p'))
let s:scripts_path = substitute(s:current_script, '\.vimrc', '', '')

let base_configs = [
  \ '01_general.vim',
  \ '02_autocommands.vim',
  \ '03_mappings.vim',
  \ '04_plugins.vim',
  \ '05_neovide_gui.vim'
  \ ]

let lua_configs = [
  \ '04_plugins.lua',
  \ '04_fzf.vim',
  \ '05_completion.lua',
  \ '06_lsp.lua',
  \ '07_statusline.lua',
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
  if s:nvim
    colorscheme base16-tomorrow
  else
    colorscheme Tomorrow
  endif
endif

" ~ end profile loading
let s:profile_loads += 1

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
