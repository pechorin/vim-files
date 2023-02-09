" ~ Custom bindings/mappings via u_keymapper.vim plugin

call u_keymapper#init()

" remap ; to :
nmap ; :

" set leader key for custom commands
let mapleader=","

" https://github.com/r00k/dotfiles/blob/master/vimrc
" Disable that goddamn 'Entering Ex mode. Type 'visual' to go to Normal mode.'
" that I trigger 40x a day.
nmap Q <Nop>

" Disable K looking man stuff up
nmap K <Nop>

KeyMapGroup "Bash-like keys for cmd"
  KeyMap cnoremap <C-A> <Home> "Bash-like CTRL+A for command line"
  KeyMap cnoremap <C-E> <End>  "Bash-like CTRL+E for command line"
  KeyMap cnoremap <C-K> <C-U>  "Bash-like CTRL+K for command line"
KeyMapGroupEnd

KeyMapGroup "Text manipulation"
  KeyMap xmap ga <Plug>(EasyAlign) "Align in visual mode (e.g. `vipga`)"
  KeyMap nmap ga <Plug>(EasyAlign) "Align for a motion/text object (e.g. `gaip`)"
KeyMapGroupEnd

KeyMapGroup "Navigation"
  KeyMap nmap <leader>et :Tagbar<CR> "Tagbar"
  KeyMap nmap <leader>n :NERDTree<CR> "NERDTree for project"
  KeyMap nmap <leader>N :NERDTree %<CR> "NERDTree for current file"

  " Neotree
  KeyMap nmap <leader>m :Neotree<CR> "Neotree"
  KeyMap nmap <leader>M :Neotree %<CR> "Neotree for current file"
  KeyMap nmap <leader>, :Neotree buffers<CR> "Neotree buffers"
  KeyMap nmap <leader>. :Neotree float git_status<CR> "Neotree git"

  " Tabs
  KeyMap nmap <leader>t :tabnew<CR> "Create new tab"
  KeyMap nmap <cmd>t :tabnew<CR> "Create new tab"

  " ctrl+mousewheel for tab switching
  KeyMap nnoremap <C-ScrollWheelUp> :tabnext<CR> "ctrl+mousewheel for tab switching"
  KeyMap nnoremap <C-ScrollWheelDown> :tabprevious<CR> "ctrl+mousewheel for tab switching"

  KeyMap noremap <leader>x <cmd>bp\|bd#<CR> "Kill current buffer"

  " run AnyJump on ctrl+click
  KeyMap nnoremap <C-LeftMouse> :AnyJump<CR> "Run AnyJump on ctrl+click"
KeyMapGroupEnd

KeyMapGroup "Commenting"
  KeyMap nmap <leader>c <Plug>CommentaryLine "Comment current line"
  KeyMap vmap <leader>c <Plug>Commentary "Comment visualy selected text"
KeyMapGroupEnd

KeyMapGroup "FZF navigation"
  KeyMap nmap <leader>b :Buffers<CR> "fzf Buffers"
  KeyMap nmap <leader>q :Files<CR> "fzf Project files"
KeyMapGroupEnd

" eval current vimscrupt buffer
KeyMapGroup <leader>e "Vim manipulations"
  KeyMap nmap <leader>ec :Color <CR> "fzf colorschemes select"
  KeyMap nmap <leader>ee :so %<CR> "(vimrc) Eval current file as vimscript"
  KeyMap nmap <leader>eb :e ~/.vimrc <CR> "(vimrc) Open $MYVIMRC in current buffer"
KeyMapGroupEnd

KeyMapGroup <leader>g "Git Mappings"
  KeyMap nmap <leader>gg :Git<CR> "Open Git"
  KeyMap nmap <leader>gb :Git blame<CR> "Git blame for file"
KeyMapGroupEnd

KeyMapGroup "OSX clipboard"
  KeyMap noremap <Leader>y "*y 'Copy to system clipboard'
  KeyMap noremap <Leader>p "*p 'Paste from system clipboard'
  KeyMap noremap <Leader>Y "+y 'Copy to editor clipboard'
  KeyMap noremap <Leader>P "+p 'Paste from editor clipboard'
KeyMapGroupEnd

KeyMapGroup <leader>r "Tests runners"
  KeyMap nmap <silent> <leader>rf :TestFile<CR> "Test file"
  KeyMap nmap <silent> <leader>rd :TestFile -f d<CR> "Test file -f d"
  KeyMap nmap <silent> <leader>rn :TestNearest<CR> "Test nearest"
  KeyMap nmap <silent> <leader>rs :TestSuite<CR> "Test suite"
  KeyMap nmap <silent> <leader>rl :TestLast<CR> "Test last"
KeyMapGroupEnd

" KeyMapGroup "Terminal mode"
"   KeyMap tnoremap <Esc> <C-\><C-n> "Exit to normal mode from terminal with esc"
" KeyMapGroupEnd

" from: https://vim.fandom.com/wiki/Search_for_visually_selected_text
KeyMap vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR> "Search visual selected text via //"

" Show the quickfix window
KeyMap nnoremap <Leader>co :copen<CR> "Show quickfix"

" Hide the quickfix window
KeyMap nnoremap <Leader>cc :cclose<CR> "Hide quickfix"

" glance.nvim
KeyMap nnoremap gR <CMD>Glance references<CR> "Glance reference"
KeyMap nnoremap gD <CMD>Glance definitions<CR> "Glance definitions"
KeyMap nnoremap gY <CMD>Glance type_definitions<CR> "Glance type definitions"
KeyMap nnoremap gM <CMD>Glance implementations<CR> "Glance implementations"

" Cycle through text objects
KeyMap map <SPACE> <Plug>(wildfire-fuel) "This selects the next closest text object"
KeyMap vmap <C-SPACE> <Plug>(wildfire-water) "This selects the previous closest text object"
