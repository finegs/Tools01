# Setup fzf
# ---------
if [[ ! "$PATH" == */home/user01/.local/share/nvim/lazy/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/user01/.local/share/nvim/lazy/fzf/bin"
fi

# Use ~~ as the trigger sequence instead of the default **
#export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# Options for path completion (e.g. vim **<TAB>)
export FZF_COMPLETION_PATH_OPTS='--walker file,dir,follow,hidden'

# Options for directory completion (e.g. cd **<TAB>)
export FZF_COMPLETION_DIR_OPTS='--walker dir,follow'

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments ($@) to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}

# fzf with ripgrep(rg)
# export RG_PREFIX='rg --column --line-number --no-heading --color=always --smart-case'
# export RG_PREFIX='rg --files --column --no-heading --color=always --smart-case'
# export FZF_CTRL_T_COMMAND='fzf --bind "start:reload:$rg_prefix " --bind "change:reload:$rg_prefix {q} || true" --bind "enter:become(vim {1} +{2})" --ansi --disabled --height=50% --layout=reverse'

# To apply the command to CTRL-T as well
# export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND --preview "fzf-preview.sh {}" --preview-window "~3"'
# export FZF_CTRL_T_COMMAND='fzf --style full --preview "fzf-preview.sh {}" --bind focus:transform-header:file'
# export FZF_CTRL_T_COMMAND='rg -uu --files --style full --preview "fzf-preview.sh {}" --bind focus:transform-header:file'

# export FZF_DEFAULT_COMMAND='find . -type f' \
#                               fzf --bind 'ctrl-d:reload(find . -type d),ctrl-f:reload(eval "$FZF_DEFAULT_COMMAND")' \
#                               --preview 'fzf-preview.sh {}' \
#                                   --height=50% --layout=reverse

# ripgrep->fzf->vim [QUERY]
export _my_rfv() (
  RELOAD='reload:rg --column --color=always --smart-case {q} || :'
  OPENER='if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
            nvim {1} +{2}     # No selection. Open the current line in Vim.
          else
            nvim +cw -q {+f}  # Build quickfix list for the selected items.
          fi'
  fzf --disabled --ansi --multi \
      --bind "start:$RELOAD" --bind "change:$RELOAD" \
      --bind "enter:become:$OPENER" \
      --bind "ctrl-o:execute:$OPENER" \
      --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
      --delimiter : \
      --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
      --preview-window '~4,+{2}+4/3,<80(up)' \
      --query "$*"
)

export FZF_CTRL_T_COMMAND='rg --files'
export FZF_CTRL_T_OPTS='--preview "fzf-preview.sh {}"'

source <(fzf --zsh)
