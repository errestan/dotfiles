# Load and activate ZSH completion.
autoload -Uz compinit; compinit

# Enable which completion methods will be used.
zstyle ':completion:*' completer _extensions _complete _approximate

# Enable caching of completion results.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# Enable completion menu.
zstyle ':completion:*' menu yes select

# Group similar types of matches together.
zstyle ':completion:*' group-name ''

# Enable `ls` colour for files and directory completions.
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# --- Old configuration.

# Formatting and messages.
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'

# Set file used by compinstall.
zstyle :compinstall filename '/home/lclark/.config/zsh/.zshrc'


