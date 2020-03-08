#!/bin/bash

echo "> Active configuration working ..."
echo "> NOTE: You have to make mirrors first and set $MIRROR with export"
if [ -z $MIRROR ]
then
    echo "> You haven't set \$MIRROR, exiting..."
    exit
fi


echo "> The OS system is regarded as $1..."
echo "> Installing necessary packages..."

shopt -s expand_aliases
if [ "$1" == "Ubuntu" ]
then
    alias comcx-install='sudo apt-get install'
elif [ "$1" == "Arch" ]
then
    alias comcx-install='sudo pacman -S'
fi

cd ~
comcx-install git
comcx-install emacs

git clone https://github.com/Comcx/.conf
cp -r .conf/Workspace .
cp .conf/UI/Text/Shell/Bash/.bashrc .
cp -r .conf/UI/Text/Emacs/.emacs.d

emacs


exit


