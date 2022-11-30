" ~ Custom bindings/mappings

" remap ; to :
nmap ; :

" set leader key
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

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ~ Navigation utilities mappings ~

" Buffers lists
nmap <leader>b :Buffers<CR>

" Tagbar
map <leader>et :Tagbar<CR>

" NERDTree for current working dir
nmap <leader>n :NERDTree<CR>

" NERDTree for current file
nmap <leader>N :NERDTree %<CR>

" ~ Buffer functions mappings ~

" comment current line
nmap <leader>c <Plug>CommentaryLine

" comment block in visual mode
vmap <leader>c <Plug>Commentary

" new tab
map <leader>t :tabnew<CR>
map <cmd>t :tabnew<CR>

" ~ FZF mappings ~

" current project files
nmap <leader>q :Files<CR>

" helptags
map <leader>sh :Helptags <CR>

" theme switcher
map <leader>st :Color <CR>

" eval current vimscrupt buffer
map <leader>ee :so %<CR>

" open $MYVIMRC
map <leader>ev :vsplit ~/.vimrc <CR>

" redraw tree-sitter colors
map <leader>ed :TSBufEnable highlight <CR>

" Git mappings
nmap <leader>g :Git<CR>

" remap clipboard in osx
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Close current buffer
noremap <leader>x <cmd>bp\|bd#<CR>

" tests runner
nmap <silent> <leader>rf :TestFile<CR>
nmap <silent> <leader>rn :TestNearest<CR>
nmap <silent> <leader>rs :TestSuite<CR>
nmap <silent> <leader>rl :TestLast<CR>

" Show the quickfix window
nnoremap <Leader>co :copen<CR>

" Hide the quickfix window
nnoremap <Leader>cc :cclose<CR>

" run AnyJump on ctrl+click
nnoremap <C-LeftMouse> :AnyJump<CR>

" ctrl+mousewheel for tab switching
nnoremap <C-ScrollWheelUp> :tabnext<CR>
nnoremap <C-ScrollWheelDown> :tabprevious<CR>

" Search visual selected text via:
"   visual select text then press //
"
" from: https://vim.fandom.com/wiki/Search_for_visually_selected_text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Neotree
nmap <leader>vp :Neotree<CR>
nmap <leader>vb :Neotree buffers<CR>

" glance.nvim
nnoremap gR <CMD>Glance references<CR>
nnoremap gD <CMD>Glance definitions<CR>
nnoremap gY <CMD>Glance type_definitions<CR>
nnoremap gM <CMD>Glance implementations<CR>
