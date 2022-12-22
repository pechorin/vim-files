" ~ Custom bindings/mappings
"

let s:nvim  = has('nvim')
let s:debug = v:false

" Safe and universal keybind mapper
" for vim: regular mapping
" for nvim: mapping with desc attribute
let s:modes_mapping = {
      \"map":      [''],
      \"nmap":     ['n'],
      \"vmap":     ['v'],
      \"xmap":     ['x'],
      \"cmap":     ['c'],
      \"smap":     ['s'],
      \"omap":     ['o'],
      \"imap":     ['i'],
      \"lmap":     ['l'],
      \"tmap":     ['t'],
      \"noremap":  ['',  { "noremap": v:true }],
      \"nnoremap": ['n', { "noremap": v:true }],
      \"vnoremap": ['v', { "noremap": v:true }],
      \"xnoremap": ['x', { "noremap": v:true }],
      \"cnoremap": ['c', { "noremap": v:true }],
      \"snoremap": ['s', { "noremap": v:true }],
      \"onoremap": ['o', { "noremap": v:true }],
      \"inoremap": ['i', { "noremap": v:true }],
      \"lnoremap": ['l', { "noremap": v:true }],
      \"tnoremap": ['t', { "noremap": v:true }],
      \}

" TODO:
let s:modes_aliases =  {
      \'': ['n', 'v', 'o'],
      \'n': ['n'],
      \'v': ['v'],
      \'x': ['x'],
      \'c': ['c'],
      \}

let s:mapping_options = ["<buffer>", "<nowait>", "<silent>", "<script>", "<expr>", "<unique>"]
let s:command_desc_regexp = "[\"|\'][[:alnum:][:blank:],.]\*[\"|\']$"

fu! s:safe_key_map(...)
  let l:options = {}

  let l:maybe_desc = matchstr(a:1, s:command_desc_regexp)

  if len(l:maybe_desc)
    let l:maybe_desc = substitute(l:maybe_desc, "'", '', 'g')
    let l:maybe_desc = substitute(l:maybe_desc, "\"", '', 'g')
    let l:options['desc'] = l:maybe_desc
  endif

  let l:without_desc = substitute(a:1, s:command_desc_regexp, '', '')

  if s:nvim
    let l:lhs_rhs = l:without_desc

    for map_opt in s:mapping_options
      let l:m = matchstr(l:lhs_rhs, map_opt)

      if len(l:m)
        let l:opt_name = substitute(map_opt, '<', '', '')
        let l:opt_name = substitute(l:opt_name, '>', '', '')
        let l:lhs_rhs  = substitute(l:lhs_rhs, map_opt, '', '')
        let l:lhs_rhs  = substitute(l:lhs_rhs, '  ', ' ', '')

        let l:options[l:opt_name] = v:true
      endif
    endfor

    let l:cmd = matchstr(l:lhs_rhs, "^[[:alnum:]]\*")
    let l:lhs_rhs = substitute(l:lhs_rhs, l:cmd, '', '')
    let l:mode_mapping = get(s:modes_mapping, l:cmd)
    let l:mode = l:mode_mapping[0]

    if type(l:mode) != v:t_string
      echoer 'mode mapping not defined for [' .. l:cmd .. ']'
    endif

    if len(l:mode_mapping) > 1
      let l:options = extend(l:options, l:mode_mapping[1])
    endif

    let l:splitted = split(l:lhs_rhs, ' ')
    let l:lhs = l:splitted[0]
    let l:rhs = l:splitted[1:-1]

    if s:debug
      echo "final call -> nvim_set_keymap " ..
            \ l:mode .. ' ' ..
            \ l:lhs .. ' ' ..
            \ join(l:rhs, ' ') .. ' ' ..
            \ string(l:options)
    end

    call nvim_set_keymap(l:mode, l:lhs, join(l:rhs, ' '), l:options)
  else
    execute l:without_desc
  endif
endfu

command! -nargs=* KeyMap call s:safe_key_map(<q-args>)

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

" Bash like keys for the command line
KeyMap cnoremap <C-A> <Home>
KeyMap cnoremap <C-E> <End>
KeyMap cnoremap <C-K> <C-U>

" Start interactive EasyAlign in visual mode (e.g. vipga)
KeyMap xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
KeyMap nmap ga <Plug>(EasyAlign)

" ~ Navigation utilities mappings ~

" Buffers lists
KeyMap nmap <leader>b :Buffers<CR> "FZF Buffers"

" Tagbar
KeyMap nmap <leader>et :Tagbar<CR> "Tagbar"

" NERDTree for current working dir
KeyMap nmap <leader>n :NERDTree<CR> "NERDTree for project"

" NERDTree for current file
KeyMap nmap <leader>N :NERDTree %<CR> "NERDTree for current file"

" ~ Buffer functions mappings ~

" comment current line
KeyMap nmap <leader>c <Plug>CommentaryLine "Comment current line"

" comment block in visual mode
KeyMap vmap <leader>c <Plug>Commentary "Comment visualy selected text"

" new tab
KeyMap nmap <leader>t :tabnew<CR> "Create new tab"
KeyMap nmap <cmd>t :tabnew<CR> "Create new tax"

" ~ FZF mappings ~

" current project files
KeyMap nmap <leader>q :Files<CR> "FZF Project files"

" helptags
KeyMap nmap <leader>sh :Helptags <CR> "FZF Help tags"

" theme switcher
KeyMap nmap <leader>st :Color <CR> "FZF Color themes"

" eval current vimscrupt buffer
KeyMap nmap <leader>ee :so %<CR> "Eval current file as vimscript"

" open $MYVIMRC
KeyMap nmap <leader>ev :e ~/.vimrc <CR> "Open $MYVIMRC in current buffer"

" Git mappings
KeyMap nmap <leader>gg :Git<CR> "Open Git"
KeyMap nmap <leader>gb :Git blame<CR> "Git blame for file"

" remap clipboard in osx
KeyMap noremap <Leader>y "*y 'Copy to system clipboard'
KeyMap noremap <Leader>p "*p 'Paste from system clipboard'
KeyMap noremap <Leader>Y "+y 'Copy to editor clipboard'
KeyMap noremap <Leader>P "+p 'Paste from editor clipboard'

" Close current buffer
KeyMap noremap <leader>x <cmd>bp\|bd#<CR> "Kill current buffer"

" Tests runner
KeyMap nmap <silent> <leader>rf :TestFile<CR> "Test file"
KeyMap nmap <silent> <leader>rn :TestNearest<CR> "Test nearest"
KeyMap nmap <silent> <leader>rs :TestSuite<CR> "Test suite"
KeyMap nmap <silent> <leader>rl :TestLast<CR> "Test last"

" Show the quickfix window
KeyMap nnoremap <Leader>co :copen<CR> "Show quickfix"

" Hide the quickfix window
KeyMap nnoremap <Leader>cc :cclose<CR> "Hide quickfix"

" run AnyJump on ctrl+click
KeyMap nnoremap <C-LeftMouse> :AnyJump<CR> "Run AnyJump on ctrl+click"

" ctrl+mousewheel for tab switching
KeyMap nnoremap <C-ScrollWheelUp> :tabnext<CR> "ctrl+mousewheel for tab switching"
KeyMap nnoremap <C-ScrollWheelDown> :tabprevious<CR> "ctrl+mousewheel for tab switching"

" from: https://vim.fandom.com/wiki/Search_for_visually_selected_text
KeyMap vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR> "Search visual selected text via //"

" Neotree
KeyMap nmap <leader>m :Neotree<CR> "Neotree"
KeyMap nmap <leader>M :Neotree %<CR> "Neotree for current file"
KeyMap nmap <leader>, :Neotree buffers<CR> "Neotree buffers"
KeyMap nmap <leader>. :Neotree float git_status<CR> "Neotree git"

" glance.nvim
KeyMap nnoremap gR <CMD>Glance references<CR> "Glance reference"
KeyMap nnoremap gD <CMD>Glance definitions<CR> "Glance definitions"
KeyMap nnoremap gY <CMD>Glance type_definitions<CR> "Glance type definitions"
KeyMap nnoremap gM <CMD>Glance implementations<CR> "Glance implementations"
