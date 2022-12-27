### 💻 vim/neovim bundle

Please backup your current .vim, .vimrc and .config/nvim/init.vim, after this just run `./install.sh`, all symlinks will be created. So it's safe if your already use symlinks for your vim config files, just run install script and try this bundle out. Maybe you will find some ideas for you own config.

```bash
cd ~ && git clone https://github.com/pechorin/vim-files

# create symlinks for (.vim, .config/nvim/init.vim, .vimrc, ctags) in your home directory
~/vim-files/install.sh
```

### Requirements

- git
- bash
- vim (neovim 0.8+ is preferrable)
- ripgrep
- ctags
- for ruby dev: rbenv & solargraph
- go runtime
- `npm install -g vim-language-server`
- `brew install lua-language-server`
-
### Features

| feature        | description                      | notes                                                         | nvim only |
|----------------|----------------------------------|---------------------------------------------------------------|-----------|
| compability    | works with both vim and neovim   | nvim for local development, vim-only part for remote machines | 0         |
| tree-sitter    | syntax hightlighting             |                                                               | v:true    |
| lsp            |                                  | language server via native nvim implementation                | v:true    |
| vim-table-mode | table mode editing like org-mode | enable via <kbd><leader>tm</kdb> or `:TableModeToggle`        | 0         |

### Keybindings

| mode  | key                   | command                           | description                                |
|-------|-----------------------|-----------------------------------|--------------------------------------------|
| c     | `<C-A>`               | <Home>                            |                                            |
| c     | `<C-E>`               | <End>                             |                                            |
| c     | `<C-K>`               | <C-U>                             |                                            |
| x     | `ga`                  | <Plug>(EasyAlign)                 | Align in visual mode (e.g. vipga)          |
| n     | `ga`                  | <Plug>(EasyAlign)                 | Align for a motion/text object (e.g. gaip) |
| n     | `<leader>b`           | :Buffers<CR>                      | FZF Buffers                                |
| n     | `<leader>et`          | :Tagbar<CR>                       | Tagbar                                     |
| n     | `<leader>n`           | :NERDTree<CR>                     | NERDTree for project                       |
| n     | `<leader>N`           | :NERDTree %<CR>                   | NERDTree for current file                  |
| n     | `<leader>c`           | <Plug>CommentaryLine              | Comment current line                       |
| v     | `<leader>c`           | <Plug>Commentary                  | Comment visualy selected text              |
| n     | `<leader>t`           | :tabnew<CR>                       | Create new tab                             |
| n     | `<cmd>t`              | :tabnew<CR>                       | Create new tax                             |
| n     | `<leader>q`           | :Files<CR>                        | FZF Project files                          |
| n     | `<leader>sh`          | :Helptags <CR>                    | FZF Help tags                              |
| n     | `<leader>st`          | :Color <CR>                       | FZF Color themes                           |
| n     | `<leader>ee`          | :so %<CR>                         | Eval current file as vimscript             |
| n     | `<leader>ev`          | :e ~/.vimrc <CR>                  | Open $MYVIMRC in current buffer            |
| n     | `<leader>gg`          | :Git<CR>                          | Open Git                                   |
| n     | `<leader>gb`          | :Git blame<CR>                    | Git blame for file                         |
| n,v,o | `<Leader>y`           | "*y                               | Copy to system clipboard                   |
| n,v,o | `<Leader>p`           | "*p                               | Paste from system clipboard                |
| n,v,o | `<Leader>Y`           | "+y                               | Copy to editor clipboard                   |
| n,v,o | `<Leader>P`           | "+p                               | Paste from editor clipboard                |
| n,v,o | `<leader>x`           | <cmd>bp\|bd#<CR>                  | Kill current buffer                        |
| n     | `<leader>rf`          | :TestFile<CR>                     | Test file                                  |
| n     | `<leader>rd`          | :TestFile -f d<CR>                | Test file -f d                             |
| n     | `<leader>rn`          | :TestNearest<CR>                  | Test nearest                               |
| n     | `<leader>rs`          | :TestSuite<CR>                    | Test suite                                 |
| n     | `<leader>rl`          | :TestLast<CR>                     | Test last                                  |
| n     | `<Leader>co`          | :copen<CR>                        | Show quickfix                              |
| n     | `<Leader>cc`          | :cclose<CR>                       | Hide quickfix                              |
| n     | `<C-LeftMouse>`       | :AnyJump<CR>                      | Run AnyJump on ctrl+click                  |
| n     | `<C-ScrollWheelUp>`   | :tabnext<CR>                      | ctrl+mousewheel for tab switching          |
| n     | `<C-ScrollWheelDown>` | :tabprevious<CR>                  | ctrl+mousewheel for tab switching          |
| v     | `//`                  | y/\V<C-R>=escape(@",'/\')<CR><CR> | Search visual selected text via //         |
| n     | `<leader>m`           | :Neotree<CR>                      | Neotree                                    |
| n     | `<leader>M`           | :Neotree %<CR>                    | Neotree for current file                   |
| n     | `<leader>,`           | :Neotree buffers<CR>              | Neotree buffers                            |
| n     | `<leader>.`           | :Neotree float git_status<CR>     | Neotree git                                |
| n     | `gR`                  | <CMD>Glance references<CR>        | Glance reference                           |
| n     | `gD`                  | <CMD>Glance definitions<CR>       | Glance definitions                         |
| n     | `gY`                  | <CMD>Glance type_definitions<CR>  | Glance type definitions                    |
| n     | `gM`                  | <CMD>Glance implementations<CR>   | Glance implementations                     |
