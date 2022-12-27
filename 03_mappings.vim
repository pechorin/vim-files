" ~ Custom bindings/mappings
"
"

let s:nvim  = has('nvim')
let g:uni_mapper_debug = 0

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

" " Maybe in furute for reverse mapping line <silent> `n <leader>x something`
" " not sure is it legal
" let s:short_modes_mapping = {
"       \'': 'map',
"       \'n': 'nmap',
"       \'v': 'vmap',
"       \'x': 'xmap',
"       \'c': 'cmap',
"       \'s': 'smap',
"       \'i': 'imap',
"       \'l': 'lmap',
"       \'t': 'tmap',
"       \}

" let s:short_modes_noremapping = {
"       \'':  'noremap',
"       \'n': 'nnoremap',
"       \'v': 'vnoremap',
"       \'x': 'xnoremap',
"       \'c': 'cnoremap',
"       \'s': 'snoremap',
"       \'i': 'inoremap',
"       \'l': 'lnoremap',
"       \'t': 'tnoremap',
"       \}

let s:modes_aliases =  {
      \'': ['n', 'v', 'o'],
      \'n': ['n'],
      \'v': ['v'],
      \'x': ['x'],
      \'c': ['c'],
      \}

" TODO: rename to mapping_args ?
let s:mapping_options = ["<buffer>", "<nowait>", "<silent>", "<script>", "<expr>", "<unique>"]

" NOTE:
" `!#$%&()*+,./:;<=>?@\^_`{|}~-` -> posix [:punct] without `'` and '"'
let s:command_desc_regexp = "[\"|\'][[:alnum:][:blank:]!#$%&()*+,./:;<=>?@\^_`{|}~—-]\*[\"|\']$"

let s:virtual_mappings = []
fu! s:new_virtual_mapping() abort
  let obj = {
        \'desc':         0,
        \'without_desc': 0,
        \'lhs':          0,
        \'rhs':          0,
        \'mode':         0,
        \'options':      {},
        \}

  return obj
endfu

fu! s:parse_command_to_mapping(raw_command) abort
  let l:options = {}

  " extract description from all command
  let l:maybe_desc = matchstr(a:raw_command, s:command_desc_regexp)

  " remove quotes and double quotes
  if len(l:maybe_desc)
    let l:maybe_desc = substitute(l:maybe_desc, "'", '', 'g')
    let l:maybe_desc = substitute(l:maybe_desc, "\"", '', 'g')
    let l:options['desc'] = l:maybe_desc
  endif

  " var for command without description (for classic vim map commands
  " style)
  let l:without_desc = substitute(a:raw_command, s:command_desc_regexp, '', '')

  " remove <silent> like args, and store them into object
  let l:without_args = l:without_desc
  for map_opt in s:mapping_options
    let l:m = matchstr(l:without_args, map_opt)

    if len(l:m)
      let l:opt_name = substitute(map_opt, '<', '', '')
      let l:opt_name = substitute(l:opt_name, '>', '', '')
      let l:without_args  = substitute(l:without_args, map_opt, '', '')
      let l:without_args  = substitute(l:without_args, '  ', ' ', '')

      let l:options[l:opt_name] = v:true
    endif
  endfor

  " get cmd
  let l:cmd = matchstr(l:without_args, "^[[:alnum:]]\*")
  let l:without_cmd = substitute(l:without_args, l:cmd, '', '')

  " get mode
  let l:mode_mapping = get(s:modes_mapping, l:cmd)
  let l:mode = l:mode_mapping[0]

  if type(l:mode) != v:t_string
    echoerr 'mode mapping not defined for [' .. l:cmd .. ']'
  endif

  if len(l:mode_mapping) > 1
    let l:options = extend(l:options, l:mode_mapping[1])
  endif

  " get lhs/rhs
  let l:splitted = split(l:without_cmd, ' ')
  let l:lhs = l:splitted[0]
  let l:rhs = l:splitted[1:-1]

  " build virtual command
  let l:result              = s:new_virtual_mapping()
  let l:result.desc         = l:maybe_desc
  let l:result.without_desc = l:without_desc
  let l:result.options      = l:options
  let l:result.lhs          = l:lhs
  let l:result.rhs          = l:rhs
  let l:result.mode         = l:mode

  return l:result
endfu

fu! s:safe_key_map(...) abort
  let l:mapping = s:parse_command_to_mapping(a:1)

  if g:uni_mapper_debug
    echo 'KeyMap -> ' . string(l:mapping)
  end

  call add(s:virtual_mappings, l:mapping)

  if s:nvim
    call nvim_set_keymap(l:mapping.mode, l:mapping.lhs, join(l:mapping.rhs, ' '), l:mapping.options)
  else
    execute l:mapping.without_desc
  endif
endfu

" Write all your mappings table to current buffer starting current line
"
" options:
"   `{ "write_to_buffer": v:false }` - do not write anything to buffer, just return result
"   `{ "tabelize": v:true }` - use vim-table-mode plugin to format result table
"
" returns:
"   csv string formatter with `;` delimiter
"
" notes:
"
"   you can use return result for any external integration
"
fu! s:safe_key_map_export(...) abort
  if len(s:virtual_mappings) == 0
    echoerr 'Key mappings not defined via KeyMap command'
    return
  endif

  " where to starte writing
  let initial_line = line('.')

  " cur line to write
  let cur_line = initial_line

  " writed lines counter
  let writed = 0

  " default options
  let options         = {}
  let write_to_buffer = v:true
  let tableize        = v:false

  " parse options
  if a:0 && type(a:1) == v:t_dict
    let options = a:1

    if has_key(options, 'tableize')
      let tableize = options.tableize
    end

    if has_key(options, 'write_to_buffer')
      let write_to_buffer = options.write_to_buffer
    end
  endif

  let csv = ""
  let header = 'mode; key; command; description'

  let csv = csv .. header .. "\n"
  if write_to_buffer
    call append(cur_line, header)
    let writed = writed + 1
    let cur_line = cur_line + 1
  end

  if tableize
    call append(cur_line, '|-|')
    let writed = writed + 1
    let cur_line = cur_line + 1
  end

  for vm in s:virtual_mappings
    let line = [
          \join(s:modes_aliases[vm.mode], ','),
          \'`' .. vm.lhs .. '`',
          \join(vm.rhs, ' '),
          \len(vm.desc) ? vm.desc : ''
          \]

    let final_line = join(line, '; ')

    let csv = csv .. final_line .. "\n"
    if write_to_buffer
      call append(cur_line, final_line)
      let cur_line = cur_line + 1
      let writed = writed + 1
    end
  endfor

  if tableize
    execute initial_line .. ',' .. cur_line .. 'Tableize/;'
  end

  return csv
endfu

fu! s:safe_key_map_export_to_table(...) abort
  let csv = s:safe_key_map_export_to_csv(a:000)
  execute "normal! " . 'Tableize/; ' . csv
endfu

command! -nargs=* KeyMap call s:safe_key_map(<q-args>)
command! KeyMapExportToCSV call s:safe_key_map_export()
command! KeyMapExportToTable call s:safe_key_map_export({'tableize': v:true})

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

KeyMap xmap ga <Plug>(EasyAlign) "Align in visual mode (e.g. vipga)"

KeyMap nmap ga <Plug>(EasyAlign) "Align for a motion/text object (e.g. gaip)"

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
KeyMap nmap <silent> <leader>rd :TestFile -f d<CR> "Test file -f d"
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
