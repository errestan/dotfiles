# Setup fzf
# ---------
if [[ ! "$PATH" == */$HOME/Development/oss/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$HOME/Development/oss/fzf/bin"
fi

# Auto-completion
[[ $- == *i* ]] && [ -f "$HOME/Development/oss/fzf/shell/completion.zsh" ] && source "$HOME/Development/oss/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
[ -f "$HOME/Development/oss/fzf/shell/key-bindings.zsh" ] && source "$HOME/Development/oss/fzf/shell/key-bindings.zsh"
