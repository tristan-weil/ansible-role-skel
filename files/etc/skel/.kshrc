#
# ksh initialization

set -o emacs

if [ -e /etc/ksh.kshrc ]; then
    . /etc/ksh.kshrc
fi

# History
HISTFILE=$HOME/.ksh_history
HISTSIZE=1000
export HISTFILE HISTSIZE

# PS1
if [[ $(id -u) == "0" ]]; then
    umask 022
    PS1=$'\n\E[1;33m$(date +"%H:%M:%S") \E[1;31m$(logname)\E[0m@\E[1;31m$(hostname -s) \E[0;31m$PWD\n\E[0;31m> \E[0m'
else
    umask 027
    PS1=$'\n\E[1;33m$(date +"%H:%M:%S") \E[1;32m$(logname)\E[0m@\E[1;35m$(hostname -s) \E[1;36m$PWD\n\E[1;32m$ \E[0m'
fi
export PS1

# Aliases
if which colorls >/dev/null; then
    alias ls="/usr/local/bin/colorls -F"
fi

# enable color support of ls and also add handy aliases
if which dircolors >/dev/null; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# editor
export VISUAL=vim
export EDITOR="$VISUAL"