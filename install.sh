#!/bin/bash -ex

dest=${dest:-~}

function mktree_
{
    test ! -d $1 && mkdir -p $1 || true
}

function cp_
{
    /bin/cp -aR $1 $2
}

function err_
{
    >&2 echo $1; exit 1
}
# usage: install file|dir $src_path to|as $dst_path
function install
{
    type=$1
    src=$2
    op=$3
    dst=$4

    case $type in
        file) test -f $src || err_ "$src is not a file" ;;
        dir) test -d $src || err_ "$src is not a directory" ;;
        *) err_ "Invalid parameter (file|dir)" ;;
    esac

    case $op in
        to) mktree_ $dst; cp_ $src $dst ;;
        as) mktree_ `basename $dst`; cp_ $src $dst ;;
        *) err_ "Invalid parameter (to|as)" ;;
    esac
}

# usage: patch $file with $str
function patch
{
    file=$1
    str=$3
    grep -qsx "$file" $str || echo "$str" >> $file
}

install dir .ssh to ${dest}
chmod -R 700 ${dest}/.ssh

install file .bashrc.common to ${dest}
install file .gitignore_global to ${dest}
install file .vimrc to ${dest}
install file .tmux.conf to ${dest}
install file .LESS_TERMCAP to ${dest}

# vim plugins
install dir airline.vim to ${dest}/.vim/bundle
install dir gitgutter.vim to ${dest}/.vim/bundle
install dir neocomplete.vim to ${dest}/.vim/bundle
install dir rainbow_parentheses.vim to ${dest}/.vim/bundle
install dir scala.vim to ${dest}/.vim/bundle
# vim colors
install file sierra/colors/sierra.vim to ${dest}/.vim/colors
# vim pathogen
install file pathogen.vim/autoload/pathogen.vim to ${dest}/.vim/autoload/

if [[ $OSTYPE == darwin* ]]; then
    install file .gitconfig.darwin as ${dest}/.gitconfig
else
    install file .gitconfig.linux-gnu as ${dest}/.gitconfig
fi

patch ${dest}/.bashrc with "source .bashrc.common"

