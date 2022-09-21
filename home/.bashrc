#!/usr/bin/env bash

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Personal
#source /usr/share/bash-completion/completions/fzf
# source /usr/share/fzf/completion.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source /home/mikkel/.git-prompt.sh
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(__git_ps1)\[\033[00m\] $ "

export EDITOR="nvim"
export VISUAL="nvim"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm-global:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

. "$HOME/.cargo/env"


alias vimf="nvim \$(fzf --height 40%)"
alias localstack="$HOME/repos/mono/scripts/localstack.py"
export SCCACHE_REDIS=redis://esa
alias pyscadmin="ssh -t ws6 pyscadmin"

alias mvi="mv -iv"
alias cpi="cp -riv"
alias mkdiri="mkdir -vp"
alias rmi="rm -v"

eval $(keychain --eval --quiet id_ed25519)
