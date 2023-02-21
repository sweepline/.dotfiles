#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

source /usr/share/git/completion/git-prompt.sh
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(__git_ps1)\[\033[00m\] $ "
. "$HOME/.cargo/env"


export MOZ_ENABLE_WAYLAND=1
