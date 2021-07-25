# Setup fzf
# ---------
if [[ ! "$PATH" == */home/lclark/Development/src/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/lclark/Development/src/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/lclark/Development/src/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/lclark/Development/src/fzf/shell/key-bindings.zsh"
