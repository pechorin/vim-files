#!/usr/local/bin/bash

set -e
set -o pipefail

# ~ Install vim and nvim files symlinks to home directory
#   with backing up previous versions if exists

# ~ Ui Helpers
function echo_ok() { echo -e '\033[1;32m'"$1"'\033[0m'; }
function echo_warn() { echo -e '\033[1;33m'"$1"'\033[0m'; }
function echo_error() { echo -e '\033[1;31mERROR: '"$1"'\033[0m'; }

# ~ Install symlinks
dotfiles_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
dotfiles=(
  ".vim"
  ".vimrc"
  ".ctags"
)

echo_warn "Creating symlinks"

for item in ${dotfiles[*]}
do
  target="$dotfiles_dir/$item"

  if [ -e "$target" ]; then
      echo_warn "Symlinking: ${HOME}/${item} -> $target"
      new_link="${HOME}/${item}"

      rm -rf "$new_link"
      ln -s "$target" "$new_link" || { echo_error "Link creation failed" && exit 1; }
      echo_ok "OK"
  fi
done

# ~ install init.vim for nvim
#    TODO: add echoing >> here (for nvim init content)
mkdir -p ~/.config/nvim/

nvim_init_file = "${HOME}/config/nvim/init.vim"
if ! [ -f "${nvim_init_file}" ]; then
  cp "${dotfiles_dir}/init.vim" "${nvim_init_file}"
fi

# ~ download vim package manager if missing
test -f $HOME/.vim/autoload/plug.vim || { \
  echo_warn "Installing vim package manager";
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
}
