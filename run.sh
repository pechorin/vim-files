#!/bin/bash

DOT_FILES_DIR="my_ee"
DOT_FILES_BACKUP_POSTFIX=".bak" # postfix emacs and vim config files and home dirs

# this files && dirs will be backuped before install
DOTFILES=(".emacs" ".emacs.d" ".vim" ".vimrc" ".ackrc" ".ctags")

echo "my EE is My Editor Environment toolset \n"

MY_EE_install_toolset() {
    echo "installing toolset \n
    	  brew and ruby should be installed\n"

    # for better ruby tags
    gem install gem-ripper-tags
    gem ripper_tags

    # fast grep & fuzzy finder
    brew install fzf
    brew install ripgrep
    brew install fd

    # HEAD emacs
    brew tap d12frosted/emacs-plus
    brew install d12frosted/emacs-plus/emacs-plus --with-natural-title-bar --HEAD

    # vim
    brew install vim

    # install vim plug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

MY_EE_backup_home_dirs() {
    echo "WARNING: backing up home directories"

    for item in ${DOTFILES[*]}
    do
	if [ -e $HOME/$item ]
	then
	    copy_from="${HOME}/${item}"
	    copy_to="${copy_from}${DOT_FILES_BACKUP_POSTFIX}"

	    echo "will copy from: ${copy_from} to ${copy_to}"

	    cp -R $copy_from $copy_to
	fi
    done
}

MY_EE_install_symlinks() {
    echo "WARNING: symlinks installation"

    for item in ${DOTFILES[*]}
    do
	target="${HOME}/my_ee/${item}"

	if [ -e $target ]
	then
	    echo "target present => ${item} for installation"

	    original_source="${HOME}/${item}"

	    if [ -e $original_source ]
	    then
		echo "destroy already presented $original_source"

		rm -rf $original_source
	    fi

	    ln -s $target $original_source
	fi
    done
}


if [ $1 == "install_symlinks" ]
then
    MY_EE_install_symlinks

elif [ $1 == "install_toolset" ]
then
    MY_EE_install_toolset

elif [ $1 == "backup_home_dirs" ]
then
    MY_EE_backup_home_dirs

elif [ $1 == "sync" ]
then
    echo "Syncing with current git source repo\n"
    git add .
    git commit -m "sync source"
    git pull --rebase
    git push origin master
fi
