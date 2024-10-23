set showmode

set encoding=utf-8
set fileencodings=utf-8,cp1251

set noswapfile

set updatetime=200
set timeoutlen=250
set history=1000
set undolevels=1000

set completeopt=menu,menuone,noselect
set complete =.,w,b,u,t,i
set omnifunc=syntaxcomplete#Complete

set inccommand=nosplit

set pumblend=0
" set floatblend = 8

set mouse=a
set mousehide    " Hide the mouse when typing text
set mousefocus
set mousescroll=ver:3,hor:1

set clipboard=unnamed,unnamedplus

set termguicolors
set title        " set terminal title

function! Wildignore()
  return &wildignore + '\.hg,\.git,\.svn,*.DS_Store,*.pyc'
endfunction

set wildignore=Wildignore()
set wildmenu
set wildmode=full

set visualbell   " Use visual bell instead of beeping
set scrolloff=15 " makes vim centered like a iA Writer
set showtabline=1

set linebreak
" set showbreak=vim.fn.nr2char(8618) .. ' '
set showbreak=>>

set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set cursorline
set splitbelow
set splitright

set laststatus=2

set hidden       " this allows to edit several files in the same time without having to save them

set incsearch    " show search matches as you type
set ignorecase   " ignore case when searching
set smartcase
set showmatch

set gdefault     " all matches in a line are substituted instead of one.

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
