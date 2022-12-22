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
set updatetime=500

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
set timeoutlen=250

set completeopt=menu,menuone,noselect

set mouse=a

" === GUI
syntax on

" set guioptions-=T  " remove gui toolbar
" set guioptions-=l  " remove left-hand scrollbar
" set guioptions-=L  " remove left-hand scrollbar
" set guioptions+=a  " automatically add selected text in the VISUAL mode to system copy-paste buffer
" set guioptions-=e  " remove gui tabs

" term options
set termguicolors

" do not hl cursor in term
hi CursorLine cterm=NONE

if has('nvim')
  " completion options
  set wildoptions=pum
  set pumblend=0
  set inccommand=nosplit
  " set floatblend=8
endif
