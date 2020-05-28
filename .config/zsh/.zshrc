# Enable plug-ins.
plugins=(zsh-autosuggestions git docker docker-compose zsh-syntax-highlighting apt)

# Enable customized shell prompt.
autoload -Uz promptinit
promptinit

# Load custom prompt.
. "$ZDOTDIR/.prompt"

# Ignore duplicate commands and share history across sessions.
setopt histignorealldups sharehistory

# Set command history to be saved to a specific file.
HISTFILE=~"/.hist_file"

# Keep lots of command history.
HISTSIZE=10000000
SAVEHIST=10000000

# Enable Vim mode for command editing.
bindkey -v

# Set-up shell aliases.
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Add exports from your profile
source ~/.profile

# Source FZF key bindings if they exist.
if [ -f $FZF_ZSH_PATH ]; then
	source $FZF_ZSH_PATH
fi

# Do menu-driven completion.
zstyle ':completion:*' menu yes select

# Colour completion for some things.
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Formatting and messages.
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# Set file used by compinstall.
zstyle :compinstall filename '/home/lclark/.config/zsh/.zshrc'

autoload -Uz compinit
compinit

# Make cd push the old directory onto the directory stack.
setopt auto_pushd

# Don't push the same dir twice.
setopt pushd_ignore_dups
