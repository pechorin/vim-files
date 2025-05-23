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

KeyMapGroup "Tabs, windows, buffer navigation"
  KeyMap nmap <S-Right> :tabnext<CR> "Next tab"
  KeyMap nmap <S-Left> :tabprevious<CR> "Previous tab"

  KeyMap nmap <S-p> :tabnext<CR> "Next tab"
  KeyMap nmap <S-o> :tabprevious<CR> "Previous tab"

  KeyMap nmap <S-Up> :bnext<CR> "Next buffer"
  KeyMap nmap <S-Down> :bprevious<CR> "Prev buffer"

  KeyMap nmap Q :tabclose<CR> "Close tab"
  KeyMap nmap Z :bdelete<CR> "Delete buffer"
KeyMapGroupEnd

KeyMapGroup "Visual align text"
  KeyMap xmap ga <Plug>(EasyAlign) "Align in visual mode (e.g. `vipga`)"
  KeyMap nmap ga <Plug>(EasyAlign) "Align for a motion/text object (e.g. `gaip`)"
KeyMapGroupEnd

KeyMapGroup "Navigation"
  " KeyMap nmap <leader>et :Tagbar<CR> "Tagbar"
  KeyMap nmap <leader>n :NERDTree<CR> "NERDTree for project"
  KeyMap nmap <leader>N :NERDTree %<CR> "NERDTree for current file"

  " Neotree
  KeyMap nmap <leader>m :Neotree<CR> "Neotree"
  KeyMap nmap <leader>M :Neotree %<CR> "Neotree for current file"
  KeyMap nmap <leader>, :Neotree buffers<CR> "Neotree buffers"
  KeyMap nmap <leader>. :Neotree float git_status<CR> "Neotree git"

  " Tabs
  KeyMap nmap <leader>t :tabnew<CR> "Create new tab"

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
  KeyMap nmap <leader>b :FzfLua buffers<CR> "fzf Buffers"
  " KeyMap nmap <leader>q :Files<CR> "fzf Project files"
  KeyMap nmap <leader>q :FzfLua files<CR> "fzf Project files"
  KeyMap nmap <leader>rr :FZFMru<cr> "fzf most recent used files"
  KeyMap nmap <leader>rh :History<cr> "fzf history"
  KeyMap nmap <leader>sr :Rg "fzf rg"
  KeyMap nmap <leader>sc :Commits<cr> "fzf commits list"

  KeyMap nmap <leader>ff :FzfLua files<CR> "fzf-lua files"
  KeyMap nmap <leader>fa :FzfLua<CR> "fzf-lua all pickers"
KeyMapGroupEnd

KeyMapGroup <leader>e "Colors"
  " KeyMap nmap <leader>ec :Color <CR> "fzf colorschemes select"
  KeyMap nmap <leader>ec :FzfLua colorschemes<CR> "fzf-lua colorschemes"
KeyMapGroupEnd

" eval current vimscrupt buffer
KeyMapGroup <leader>e "Vim config manipulations"
  KeyMap nmap <leader>ee :so %<CR> "(vimrc) Eval current file as vimscript"
  KeyMap nmap <leader>eb :e ~/.vimrc <CR> "(vimrc) Open $MYVIMRC in current buffer"
KeyMapGroupEnd

KeyMapGroup <leader>g "Git Mappings"
  KeyMap nmap <leader>gg :tab Git<CR> "Open Git in new tab"
  KeyMap nmap <leader>gG :Git<CR> "Open Git in split"
  KeyMap nmap <leader>gb :Git blame<CR> "Git blame for file"
  KeyMap nmap <leader>gl :Gllog<CR> "Git logs"
KeyMapGroupEnd

" KeyMapGroup <leader>r "Tests runners"
"   KeyMap nmap <silent> <leader>rf :TestFile<CR> "Test file"
"   KeyMap nmap <silent> <leader>rd :TestFile -f d<CR> "Test file -f d"
"   KeyMap nmap <silent> <leader>rn :TestNearest<CR> "Test nearest"
"   KeyMap nmap <silent> <leader>rs :TestSuite<CR> "Test suite"
"   KeyMap nmap <silent> <leader>rl :TestLast<CR> "Test last"
" KeyMapGroupEnd

KeyMapGroup "Terminal mode"
  " KeyMap tnoremap <Esc> <C-\><C-n> "Exit to normal mode from terminal with esc"

  " make C-w C-w works in term
  KeyMap tnoremap <C-w> <C-\><C-o><C-w> "Make C-w C-w works in term"
KeyMapGroupEnd

" source: https://vim.fandom.com/wiki/Search_for_visually_selected_text
KeyMap vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR> "Search visual selected text via //"

KeyMapGroup 'Quickfix'
  KeyMap nnoremap <Leader>co :copen<CR> "Show quickfix"
  KeyMap nnoremap <Leader>cc :cclose<CR> "Hide quickfix"
KeyMapGroupEnd

KeyMapGroup 'Cycle through text objects with space'
  KeyMap map <SPACE> <Plug>(wildfire-fuel) "This selects the next closest text object"
  KeyMap vmap <C-SPACE> <Plug>(wildfire-water) "This selects the previous closest text object"
KeyMapGroupEnd

" KeyMapGroup <leader>g "Telescope"
"   KeyMap nnoremap <leader>gT <cmd>Telescope<cr> "Telescope"
"   KeyMap nnoremap <leader>gf <cmd>Telescope find_files<cr> "Files"
"   KeyMap nnoremap <leader>gb <cmd>Telescope buffers<cr> "Buffers"
"   KeyMap nnoremap <leader>gl <cmd>Telescope oldfiles<cr> "Old files"
"   KeyMap nnoremap <leader>gc <cmd>Telescope themes<cr> "Themes"
"   KeyMap nnoremap <leader>gk <cmd>Telescope keymaps<cr> "Keys"
"   KeyMap nnoremap <leader>gh <cmd>Telescope git_commits<cr> "Git commits"
"   KeyMap nnoremap <leader>gs <cmd>Telescope git_status<cr> "Git status"
"   KeyMap nnoremap <leader>gr <cmd>Telescope registers<cr> "Keys"
"   KeyMap nnoremap <leader>gd <cmd>Telescope diagnostics<cr> "Keys"
" KeyMapGroupEnd

KeyMap nnoremap <Leader>gS :lua require('search').open()<CR> "Run search window"
