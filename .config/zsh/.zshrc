# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Ignore duplicate commands and share history across sessions.
setopt histignorealldups sharehistory

# Make cd push the old directory onto the directory stack.
setopt auto_pushd

# Don't push the same directory twice.
setopt pushd_ignore_dups

# Set command history to be saved to a specific file.
HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
mkdir -p "${HISTFILE:h}"

# Keep a generous but sane amount of command history.
HISTSIZE=50000
SAVEHIST=50000

# Configure FZF to use a TMux pane.
FZF_TMUX=1
FZF_TMUX_OPTS="-p"

# Enable Vim mode for command editing only if NOT running inside NeoVim.
[[ -z $NVIM ]] && bindkey -v

# Accept auto-suggestion.
bindkey '^n' autosuggest-accept

# Set-up shell aliases.
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias vi=nvim

# Source FZF key bindings if they exist.
[ -f "$ZDOTDIR/fzf.zsh" ] && source "$ZDOTDIR/fzf.zsh"

# Source a local ZSH configuration file.
[ -f "$ZDOTDIR/.zshrc.local" ] && source "$ZDOTDIR/.zshrc.local"

# Z-Plug Configuration.
ZPLUG_PATH="$HOME/Development/oss/zplug/init.zsh"
[ -f "$ZPLUG_PATH" ] && source "$ZPLUG_PATH"

if command -v zplug > /dev/null; then
    # FZF Git completion.
    zplug "hschne/fzf-git"
    zplug "zsh-users/zsh-autosuggestions"
    zplug "zsh-users/zsh-syntax-highlighting", defer:2
    zplug romkatv/powerlevel10k, as:theme, depth:1

    # Install plug-ins if there are plug-ins that have not been installed.
    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    # Then, source plug-ins and add commands to $PATH
    zplug load
else
    echo "Error: ZPlug not installed" >&2
fi

# Source ZSH completion configuration. Run after zplug load so completions
# contributed by plug-ins are registered by compinit.
[ -f "$ZDOTDIR/completion.zsh" ] && source "$ZDOTDIR/completion.zsh"

# Enable 'direnv' if available.
if command -v direnv > /dev/null; then
    eval "$(direnv hook zsh)"
else
    echo "Error: direnv not installed" >&2
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f "$ZDOTDIR/.p10k.zsh" ]] || source "$ZDOTDIR/.p10k.zsh"
