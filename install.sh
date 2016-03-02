#!/bin/bash

dest=${dest:-~}

# usage: install $what $where
function install 
{
    if [ -d $1 ]; then
        mkdir -p $2 || true
    fi
    /bin/cp -aR $1 $2
}

# usage: patch $file $str
function patch
{
    grep -qsx "$2" $1 || echo "$2" >> $1
}

install .ssh ${dest}
chmod -R 700 ${dest}/.ssh

install .bashrc.common ${dest}
install .gitignore_global ${dest}
install .vimrc ${dest}
install .tmux.conf ${dest}
install .LESS_TERMCAP ${dest}

# vim plugins
install airline.vim ${dest}/.vim/bundle
install gitgutter.vim ${dest}/.vim/bundle
install neocomplete.vim ${dest}/.vim/bundle
install rainbow_parentheses.vim ${dest}/.vim/bundle
install scala.vim ${dest}/.vim/bundle
# vim colors
install sierra/colors/sierra.vim ${dest}/.vim/colors
# vim pathogen
install pathogen.vim ${dest}/.vim/autoload

if [[ $OSTYPE == darwin* ]]; then
    install .gitconfig.darwin ${dest}/.gitconfig
else
    install .gitconfig.linux-gnu ${dest}/.gitconfig
fi

patch ${dest}/.bashrc "source .bashrc.common"

