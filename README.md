### 💻 vim/neovim bundle

Please backup your current .vim, .vimrc and .config/nvim/init.vim, after this just run `./install`, all symlinks will be created. So it's safe if your already use symlinks for your vim config files, just run install script and try this bundle out. Maybe you will find some ideas for you own config.

```bash
cd ~ && git clone https://github.com/pechorin/vim-files

# create symlinks for (.vim, .config/nvim/init.vim, .vimrc, ctags) in your home directory
~/vim-files/install
```

### Requirements

- git
- bash
- vim (neovim 0.7+ is preferrable)
- ripgrep
- ctags
- for ruby dev: rbenv & solargraph
- go runtime

### Bindings and usage

| key           | description                          |
|---------------+--------------------------------------|
| <kbd>,</kbd>  | leader key (for all custom mappings) |
| <kbd>\\</kbd> | local leader key                     |

### Features

| feature        | description                      | notes                                                  |
|----------------+----------------------------------+--------------------------------------------------------|
| tree-sitter    | syntax hightlighting             |                                                        |
| lsp            |                                  | language server via native nvim implementation         |
| vim-table-mode | table mode editing like org-mode | enable via <kbd><leader>tm</kdb> or `:TableModeToggle` |
