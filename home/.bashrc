#!/usr/bin/env bash

# Personal
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

source /usr/share/git/completion/git-prompt.sh
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(__git_ps1)\[\033[00m\] $ "

export EDITOR="nvim"
export VISUAL="nvim"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm-global:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

alias vimf="nvim \$(fzf --height 40%)"
alias localstack="$HOME/repos/mono/scripts/localstack.py"
export SCCACHE_REDIS=redis://esa
alias pyscadmin="ssh -t ws6 pyscadmin"

alias mvi="mv -iv"
alias cpi="cp -riv"
alias mkdiri="mkdir -vp"
alias rmi="rm -v"
