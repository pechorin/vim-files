" == custom vimrc

set nocompatible " be iMproved
filetype off

call plug#begin('~/.vim/bundle') " vim plug " === Common plugins
Plug 'scrooloose/nerdtree'
" Plug 'kana/vim-smartinput'
Plug 'tpope/vim-commentary' " comments via <leader>-c
" Plug 'ervandew/supertab'    " completion with tab
Plug 'vim-scripts/CursorLineCurrentWindow' " each window has separate cursor
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'janko-m/vim-test'
Plug 'itchyny/lightline.vim'
Plug 'jremmen/vim-ripgrep'  " fast grep via rust
Plug 'racer-rust/vim-racer'
Plug 'junegunn/vim-easy-align'
Plug 'eugen0329/vim-esearch' " serch in project and nerdtree with <leader>ff
Plug 'tpope/vim-fugitive'
Plug 'romainl/vim-cool'
" Plug 'KryDos/dim-jump', { 'branch': 'krydos-adaptation' }
Plug '/Users/vorobey/work/dim-jump'
" Plug '/Users/vorobey/work/vim-dumb-jump'
Plug 'rhysd/git-messenger.vim'
Plug 'Kraust/floater.nvim'
Plug 'junegunn/goyo.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Plug 'jceb/vim-orgmode'
Plug 'majutsushi/tagbar'
Plug 'stephenway/postcss.vim'

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" === Language support
Plug 'rust-lang/rust.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-haml'
Plug 'kchmck/vim-coffee-script'
Plug 'plasticboy/vim-markdown'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'slim-template/vim-slim'
Plug 'mitsuhiko/jinja2'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'garyburd/go-explorer'
Plug 'wavded/vim-stylus'

" === Colorschemes
Plug 'ChrisKempson/Tomorrow-Theme', { 'rtp' : 'vim' }
Plug 'hzchirs/vim-material'
Plug 'jacoborus/tender.vim'
Plug 'rhysd/vim-color-spring-night'
Plug 'KeitaNakamura/neodark.vim'
Plug 'cormacrelf/vim-colors-github'
Plug 'dracula/vim'
Plug 'kjssad/quantum.vim'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

filetype plugin indent on

" === Configurations
" set nonumber         " display line numbers
" set nonumber       " use <LINE_NUMBER>G to jump to <LINE_NUMBER> line
set showmode       " always show what mode we're currently editing in

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

" === GUI
syntax on

if has("nvim")
else
  set guifont=Monaco:h14
endif

set guioptions-=T  " remove gui toolbar
set guioptions-=l  " remove left-hand scrollbar
set guioptions-=L  " remove left-hand scrollbar
" set guioptions+=a  " automatically add selected text in the VISUAL mode to system copy-paste buffer
" set guioptions-=e  " remove gui tabs

" term options
" set termguicolors

" theme options


let g:material_style='oceanic'

colorscheme Tomorrow

" if has('gui_macvim')
"   set background=light
"   colorscheme macvim
" else
"   set background=light
"   colorscheme macvim
" endif

" === NERDTree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1 " Disables display of the 'Bookmarks' label and 'Press ? for help' text.
let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.

" === remap ; to :
nmap ; :

" === leader key
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

set shell=/bin/bash

set complete=.,w,b,u,t,i

" hamljs
au BufNewFile,BufRead *.lmx set filetype=haml

" some custome staff
" autocmd FocusLost * :wa " Save on losing focus

" javascript-libraries-syntax.vim
let g:used_javascript_libs = 'underscore, backbone, angularjs'

" js tab == 4 spaces
au FileType javascript setl sw=2 sw=2 sts=2

" markdown
let g:vim_markdown_folding_disabled=1

" vim-test mappings
" nmap <silent> <leader>t :TestNearest<CR>
" nmap <silent> <leader>T :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>
" let test#strategy = "dispatch"

"  ruby
let ruby_operators        = 1
let ruby_pseudo_operators = 1

" esearch
if has('nvim')
  let g:esearch = { 'adapter': 'rg', 'backend': 'nvim', 'out': 'qflist' }
else
  let g:esearch = { 'adapter': 'rg', 'backend': 'vim8', 'out': 'qflist' }
endif

" Customize fzf colors to match your color scheme
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }


" Filetypes detection au BufNewFile,BufRead *.js.erb set filetype=javascript
au BufNewFile,BufRead *.rs     set filetype=rust
au BufNewFile,BufRead *.yml.j2 set filetype=yaml
au BufNewFile,BufRead *.cjsx   set filetype=coffee
au BufNewFile,BufRead *.pcss   set filetype=postcss
au BufNewFile,BufRead *.arb	   set ft=ruby

" use rg
set grepprg=rg\ --color=never

:hi CursorLine cterm=NONE

" pretty colymn hi for yaml modes
autocmd FileType yaml setlocal cursorcolumn
autocmd FileType eruby.yaml setlocal cursorcolumn

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


if has("nvim")
  " == cool popup from nvim 0.4
  set wildoptions=pum
  set pumblend=8
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


let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste', 'gutentags', 'method' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'gutentags': "gutentags#statusline"
      \ },
      \ }


" --- Tags

augroup MyGutentagsStatusLineRefresher
    autocmd!
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
augroup END

let g:gutentags_define_advanced_commands = 1
" let g:gutentags_trace = 1

let g:gutentags_ctags_exclude = ['*.js', '*.jsx', '*.coffee', '*.js.erb', 'node_modules']

" if executable('rg')
"   let g:gutentags_file_list_command = 'rg --files'
" end


" --- Material theme different configs ---
" TODO: add functions for each type of theme

" Dark
" set background=dark
" colorscheme vim-material

" Palenight
" let g:material_style='palenight'
" set background=dark
" colorscheme vim-material

" Oceanic
" let g:material_style='oceanic'
" set background=dark
" colorscheme vim-material

" Light
" set background=light
" colorscheme vim-material


" --- Custom bindings ---

" Buffers lists
nmap <leader>b :Buffers<CR>

" Open NERDTree for pwd
nmap <leader>n :NERDTree<CR>

" Open NERDTree for %
nmap <leader>N :NERDTree %<CR>

" comment line
nmap <leader>c <Plug>CommentaryLine

" comment block in visual mode
vmap <leader>c <Plug>Commentary

" open $MYVIMRC
map <leader>ev :vsplit ~/.vimrc <CR>

" eval current buffer (for dev testing)
map <leader>ee :so % <CR>

" FZF files for pwd
nmap <leader>q :Files<CR>

" fast helptags with FZF
map <leader>sh :Helptags <CR>

" fast theme switching
map <leader>st :Color <CR>

" map <leader>sx :Tags <CR>

" new tab
map <leader>T :tabnew<CR>

" jump to definition
nmap <leader>fd :DimJumpPos<CR>

" map ESC for enter to normal mode inside terminal
" tmap <ESC> <C-\><C-n>

" - terminal keys -

" improved keyboard support for navigation (especially terminal)
" https://neovim.io/doc/user/nvim_terminal_emulator.html
" tnoremap <Esc> <C-\><C-n>

nnoremap <silent> <leader>tt :terminal<CR>I
nnoremap <silent> <leader>tv :vnew<CR>:terminal<CR>I
nnoremap <silent> <leader>tn :new<CR>:terminal<CR>I
nnoremap <silent> <leader>ts :new<CR>:terminal<CR> :res 15<CR>I

function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:project_tags()
call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v -a ^!',
  \ 'options': '+m -d "\t"',
  \ 'sink':    function('s:tags_sink'),
  \ 'window': 'call FloatingFZF()'
  \ })
endfunction

command! ProjectTags call s:project_tags()

map <leader>sx :ProjectTags <CR>


" --- LeaderGuider ---
let g:which_key_map = {}

let g:which_key_map.s = {
      \ 'name' : '+select'
      \ }

let g:which_key_map.g = {
      \ 'name': '+git'
      \ }

let g:which_key_map.e = {
      \ 'name': '+eval',
      \ 'v': [ "v", "vsplit ~/.vimrc" ],
      \ 'e': [ "e", "eval current buffer" ]
      \ }

let g:which_key_map.f = {
      \ 'name': '+find',
      \ 'd': [ 'd', 'jump to definition' ],
      \ 'f': [ 'f', 'run Esearch' ],
      \ 'w': [ 'w', 'Esearch word under cursor' ],
      \ }

let g:which_key_map.t = {
      \ 'name': '+terminal',
      \ 't': [ "t", "terminal window" ],
      \ 'v': [ "v", "terminal in VSplit" ],
      \ 'n': [ "n", "terminal in Split" ]
      \ }

let g:which_key_map.z = [ 'z', 'zoom current buffer' ]

call which_key#register(',', "g:which_key_map")

" I don't use leader guide as primary tool,
" but it's okay for help purpose.
" Leader Bindings-map can be shown by typing `<leader>w`
" or W for localleader mappings.
nnoremap <silent> <leader>w      :<c-u>WhichKey ','<CR>
nnoremap <silent> <localleader>W :<c-u>WhichKey '\\'<CR>

" --- Custom scripts ---

" source /Users/vorobey/my_ee/test.vim

" --- coc.nvim
let g:coc_node_path = $HOME . '/n/bin/node'
call coc#config("npm.binPath", ($HOME . "/n/bin/npm"))
" call coc#config("tsserver.npm", ($HOME . "/n/bin/npm"))

" " use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

let g:ruby_host_prog = '/usr/local/Cellar/ruby/2.6.5/bin/ruby'

let g:goyo_width = 100
let g:goyo_height = 100

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" TODO: move this kind of home dirs conig to separate file

