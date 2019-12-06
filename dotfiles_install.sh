DOTFILES=(".vim" ".vimrc" ".ackrc" ".ctags")
DOT_FILES_DIR="dotfiles"

function echo_warn() { echo -e '\033[1;33m'"$1"'\033[0m'; }

echo_warn "WARNING: dotfiles symlinks building"

for item in ${DOTFILES[*]}
do
  target="${HOME}/${DOT_FILES_DIR}/${item}"

  if [ -e $target ]
  then
      echo "target present => ${item} for installation"

      original_source="${HOME}/${item}"

      rm -rf $original_source
      ln -s $target $original_source
  fi
done
