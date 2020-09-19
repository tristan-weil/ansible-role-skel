#
# ksh initialization

if [ -e /etc/ksh.kshrc ]; then
    . /etc/ksh.kshrc
fi

if [ -e /usr/local/share/shell-completions/git-prompt-ksh.sh ]; then
    . /usr/local/share/shell-completions/git-prompt-ksh.sh
fi

# History
HISTFILE=$HOME/.ksh_history
HISTSIZE=1000
export HISTFILE HISTSIZE

# PS1
git_prompt=""
venv_prompt=""

if type git >/dev/null 2>&1; then
    export GIT_PS1_SHOWDIRTYSTATE=true
    export GIT_PS1_SHOWUNTRACKEDFILES=true
    if echo $KSH_VERSION | grep -q "PD KSH" >/dev/null 2>&1; then
        git_prompt="\e[01;31m\]\$(__git_ps1 '(%s) ')\e[0m\]"
    else
        git_prompt=$'\E[01;31m\$(__git_ps1 "(%s) ")\E[0m'
    fi
fi
if [[ ! -z $VIRTUAL_ENV ]]; then
    if echo $KSH_VERSION | grep -q "PD KSH" >/dev/null 2>&1; then
        venv_prompt="\e[0m\]($(basename $VIRTUAL_ENV))\e[0m\] "
    else
        venv_prompt=$'\E[0m($(basename $VIRTUAL_ENV))\E[0m '
    fi
fi

if [[ $(id -u) == "0" ]]; then
    umask 022

    if echo $KSH_VERSION | grep -q "PD KSH" >/dev/null 2>&1; then
        PS1="\n\e[1;33m\]\$(date +"%H:%M:%S") ${venv_prompt}\e[1;31m\]\$(logname)\e[0m\]@\e[1;31m\]\$(hostname -s) \e[0;31m\]\$PWD ${git_prompt}\n\e[0;31m\]> \e[0m\]"
    else
        PS1=$'\n\E[1;33m\$(date +"%H:%M:%S") ${venv_prompt}\E[1;31m\$(logname)\E[0m@\E[1;31m\$(hostname -s) \E[0;31m\$PWD '${git_prompt}$'\n\E[0;31m> \E[0m'
    fi
else
    umask 027
    if echo $KSH_VERSION | grep -q "PD KSH" >/dev/null 2>&1; then
        PS1="\n\e[1;33m\]\$(date +"%H:%M:%S") ${venv_prompt}\e[1;32m\]\$(logname)\e[0m\]@\e[1;35m\]\$(hostname -s) \e[0;36m\]\$PWD ${git_prompt}\n\e[0;32m\]> \e[0m\]"
    else
        PS1=$'\n\E[1;33m\$(date +"%H:%M:%S") ${venv_prompt}\E[1;32m\$(logname)\E[0m@\E[1;35m\$(hostname -s) \E[1;36m\$PWD '${git_prompt}$'\n\E[1;32m$ \E[0m'
    fi
fi
export PS1

# Aliases
if which colorls >/dev/null 2>&1; then
    alias ls="/usr/local/bin/colorls -F"
fi

# enable color support of ls and also add handy aliases
if which dircolors >/dev/null 2>&1; then
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

# reset emacs mode
set -o emacs
