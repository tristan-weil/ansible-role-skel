#
# bash initialization

if [ -e /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
elif [ -e /etc/bashrc ]; then
    . /etc/bashrc
fi

# History
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# PS1
__prompt_command() {
    local EXIT="$?"             # This needs to be first
    PS1=""

    if [[ $(id -u) == "0" ]]; then
        umask 022
        PS1="\n\[\e[1;33m\]\t \[\e[1;31m\]\u\[\e[0m\]@\[\e[1;31m\]\h \[\e[0;31m\]\w \[\e[0;33m\][$EXIT]\n\[\e[1;31m\]> \[\e[0m\]"
    else
        umask 027
        PS1="\n\[\e[1;33m\]\t \[\e[1;32m\]\u\[\e[0m\]@\[\e[1;35m\]\h \[\e[1;36m\]\w \[\e[0;33m\][$EXIT]\[\e[0m\]\n\[\e[1;32m\]$ \[\e[0m\]"
    fi
}

PROMPT_COMMAND=__prompt_command

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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
