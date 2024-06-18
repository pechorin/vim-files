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
  KeyMap nmap [b :bnext<cr> "Next buffer"
  KeyMap nmap ]b :bprevious<cr> "Prev buffer"
  KeyMap nmap bd :bdelete<cr> "Delete buffer"

  KeyMap nmap <leader>et :Outline<CR> "Lsp symbols panel with outline.nvim"
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
  KeyMap nmap <leader>eb :e ~/vim-files/init.lua <CR> "(init.lua) Open init.lua in current buffer"
  KeyMap nmap <leader>ei :e ~/.vimrc <CR> "(vimrc) Open $MYVIMRC in current buffer"
KeyMapGroupEnd

KeyMapGroup <leader>g "Git Mappings"
KeyMap nmap <leader>gg :tab Git<CR> "Open Git in new tab"
KeyMap nmap <leader>gG :Git<CR> "Open Git in split"
  KeyMap nmap <leader>gb :Git blame<CR> "Git blame for file"
KeyMapGroupEnd

KeyMapGroup "OSX clipboard"
  KeyMap noremap <Leader>y "*y 'Copy to system clipboard'
  KeyMap noremap <Leader>p "*p 'Paste from system clipboard'
  KeyMap noremap <Leader>Y "+y 'Copy to editor clipboard'
  KeyMap noremap <Leader>P "+p 'Paste from editor clipboard'
KeyMapGroupEnd

KeyMapGroup <leader>r "Classic tests runners"
  KeyMap nmap <silent> <leader>rf :TestFile<CR> "Test file"
  KeyMap nmap <silent> <leader>rd :TestFile -f d<CR> "Test file -f d (in documentation format)"
  KeyMap nmap <silent> <leader>rn :TestNearest<CR> "Test nearest"
  KeyMap nmap <silent> <leader>rs :TestSuite<CR> "Test suite"
  KeyMap nmap <silent> <leader>rl :TestLast<CR> "Test last"
KeyMapGroupEnd

KeyMapGroup <leader>rt "Neotest runners"
  KeyMap nmap <silent> <leader>rf :lua require("neotest").run.run(vim.fn.expand("%"))<CR> "Neotest file"
  KeyMap nmap <silent> <leader>rn :lua require("neotest").run.run()<CR> "Neotest nearest test suite"
  KeyMap nmap <silent> <leader>rs :lua require("neotest").run.stop()<CR> "Neotest stop nearest test suite"
  KeyMap nmap <silent> <leader>ra :lua require("neotest").run.attach()<CR> "Neotest attach to nearest test suite"
  KeyMap nmap <silent> <leader>rw :lua require("neotest").watch.toggle(vim.fn.expand("%"))<CR> "Neotest watch current file"
  KeyMap nmap <silent> <leader>ro :lua require("neotest").output.toggle({ enter = true })<CR> "Neotest toggle output panel"
KeyMapGroupEnd

KeyMapGroup <leader>r "Tests runners"
  KeyMap nmap <silent> <leader>rtf :TestFile<CR> "Test file"
  KeyMap nmap <silent> <leader>rtd :TestFile -f d<CR> "Test file -f d"
  KeyMap nmap <silent> <leader>rtn :TestNearest<CR> "Test nearest"
  KeyMap nmap <silent> <leader>rts :TestSuite<CR> "Test suite"
  KeyMap nmap <silent> <leader>rtl :TestLast<CR> "Test last"
KeyMapGroupEnd

KeyMapGroup "Terminal mode"
  " KeyMap tnoremap <Esc> <C-\><C-n> "Exit to normal mode from terminal with esc"

  " make C-w C-w works in term
  KeyMap tnoremap <C-w> <C-\><C-o><C-w> "Make C-w C-w works in term"
KeyMapGroupEnd

" from: https://vim.fandom.com/wiki/Search_for_visually_selected_text
KeyMap vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR> "Search visual selected text via //"

" Show the quickfix window
KeyMap nnoremap <Leader>co :copen<CR> "Show quickfix"

" Hide the quickfix window
KeyMap nnoremap <Leader>cc :cclose<CR> "Hide quickfix"

" Cycle through text objects
KeyMap map <SPACE> <Plug>(wildfire-fuel) "This selects the next closest text object"
KeyMap vmap <C-SPACE> <Plug>(wildfire-water) "This selects the previous closest text object"

" Minimap
KeyMap nmap <leader>l :MinimapToggle<CR> "Toggle minimap"

KeyMapGroup <leader>g "Telescope"
  KeyMap nnoremap <leader>gT <cmd>Telescope<cr> "Telescope"
  KeyMap nnoremap <leader>gf <cmd>Telescope find_files<cr> "Files"
  KeyMap nnoremap <leader>gb <cmd>Telescope buffers<cr> "Buffers"
  KeyMap nnoremap <leader>gl <cmd>Telescope oldfiles<cr> "Old files"
  KeyMap nnoremap <leader>gc <cmd>Telescope themes<cr> "Themes"
  KeyMap nnoremap <leader>gk <cmd>Telescope keymaps<cr> "Keys"
  KeyMap nnoremap <leader>gh <cmd>Telescope git_commits<cr> "Git commits"
  KeyMap nnoremap <leader>gs <cmd>Telescope git_status<cr> "Git status"
  KeyMap nnoremap <leader>gr <cmd>Telescope registers<cr> "Keys"
  KeyMap nnoremap <leader>gd <cmd>Telescope diagnostics<cr> "Keys"
KeyMapGroupEnd

KeyMap nnoremap <Leader>gS :lua require('search').open()<CR> "Run search window"
