### 🧩 My config for basic osx dev machine environment setup 💻

```
cd ~ && git clone https://github.com/pechorin/dotfiles

~/dotfiles/install_osx  # install osx dev tools (brew, ripgrep, stern, k9s, dev fonts, etc)
~/dotfiles/install_home # install home directory (.vim, .vimrc, vim plug manager, ctags, zsg plugins list, etc)
```

- X-code should be installed
- using `/usr/local/bin/bash` instead of outdated osx system `/bin/bash`
- custom vim/nvim configuration (with accent on modern neovim, but without lot of lua crazyness)
- `~/dotfiles/bin` containts custom bash script helpers


### TODO

- init vim plug manager via curl/bash (storing inside git is bad tone)
- add .config folder setup
- add alacritty config
- add .zshrc config
