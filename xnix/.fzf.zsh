# Setup fzf
# ---------
[ -f /usr/share/fzf-help/fzf-help.zsh ] && source /usr/share/fzf-help/fzf-help.zsh
zle -N fzf-help-widget
bindkey "^A" fzf-help-widget


if [[ ! "$PATH" == */home/user01/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/user01/.fzf/bin"
fi

source <(fzf --zsh)
