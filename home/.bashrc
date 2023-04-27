#!/usr/bin/env bash

# Personal

# Realtime History
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# FZF Arch
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
alias vimf="nvim \$(fzf --height 40%)"

# SSH
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# GIT Prompt arch
source /usr/share/git/completion/git-prompt.sh
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(__git_ps1)\[\033[00m\] $ "

# Use nvim
export EDITOR="nvim"
export VISUAL="nvim"

# PATH Config
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm-global:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Work stuff
alias localstack="$HOME/repos/mono/scripts/localstack.py"
export SCCACHE_REDIS=redis://esa
alias pyscadmin="ssh -t ws6 pyscadmin"
alias ssh-wadd="sadmin auth; ssh-add"

# Qute aliases
alias bp="bpython"
alias mvi="mv -iv"
alias cpi="cp -riv"
alias mkdiri="mkdir -vp"
alias rmi="rm -v"
