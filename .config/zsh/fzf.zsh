# Setup fzf
# ---------
if [[ ! "$PATH" == */home/lclark/Development/src/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/lclark/Development/src/fzf/bin"
fi

# Auto-completion
[[ $- == *i* ]] && [ -f "$HOME/Development/src/fzf/shell/completion.zsh" ] && source "$HOME/Development/src/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
[ -f "$HOME/Development/src/fzf/shell/key-bindings.zsh" ] && source "$HOME/Development/src/fzf/shell/key-bindings.zsh"