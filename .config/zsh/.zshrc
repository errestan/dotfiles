# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable plug-ins.
plugins=(zsh-autosuggestions git docker docker-compose zsh-syntax-highlighting apt tmux)

# Enable customized shell prompt.
autoload -Uz promptinit; promptinit

# Enable Git info for prompt.
autoload -Uz vcs_info; precmd() { vcs_info }
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats $'\ue725 %b'
setopt PROMPT_SUBST

# Load custom prompt.
. "$ZDOTDIR/prompt.zsh"

# Ignore duplicate commands and share history across sessions.
setopt histignorealldups sharehistory

# Make cd push the old directory onto the directory stack.
setopt auto_pushd

# Don't push the same directory twice.
setopt pushd_ignore_dups

# Set command history to be saved to a specific file.
HISTFILE="$HOME/.hist_file"

# Keep lots of command history.
HISTSIZE=10000000
SAVEHIST=10000000

# Configure FZF to use a TMux pane.
FZF_TMUX=1
FZF_TMUX_OPTS="-p"

# Enable Vim mode for command editin only if NOT running inside NeoVimg.
[ -z $NVIM ] && bindkey -v

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

# Source ZSH completion configuration.
[ -f $ZDOTDIR/completion.zsh ] && source $ZDOTDIR/completion.zsh

# Source FZF key bindings if they exist.
[ -f $ZDOTDIR/fzf.zsh ] && source $ZDOTDIR/fzf.zsh

# Source a local ZSH configuration file.
[ -f $ZDOTDIR/.zshrc.local ] && source $ZDOTDIR/.zshrc.local

# Z-Plug Configuration.
ZPLUG_PATH="$HOME/.zplug/init.zsh"
[ -f $ZPLUG_PATH ] && source $ZPLUG_PATH

zplug 2>&1 > /dev/null
if [ $? -eq 0 ]; then
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
    echo "Error: ZPlug not installed" 2>&1
fi

# Enable 'direnv' if available.
direnv 2>&1 > /dev/null
if [ $? -eq 0 ]; then
    eval "$(direnv hook zsh)"
else
    echo "Error: direnv not installed" 2>&1
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
