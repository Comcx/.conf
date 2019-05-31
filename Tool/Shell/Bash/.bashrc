#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
date

#--------------Basic commands---------------#
alias ls='ls --color=auto'
alias ll='ls -l'
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias ..='cd ..'


#--------------Applications--------------#
alias vi='vim'
alias execUrxvt='xrdb ~/.Xresources'
alias setImage='feh --bg-scale'

PS1='\n\[\e[1;36m\]\u\[\e[m\] \w\n\[\e[1;35m\]>\[\e[m\] '
