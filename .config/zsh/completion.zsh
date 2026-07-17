# Load and activate ZSH completion. Cache the dump under XDG and only run the
# (slow) security check when the dump is more than 24 hours old.
autoload -Uz compinit
_zcompdump="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
mkdir -p "${_zcompdump:h}"
if [[ -n ${_zcompdump}(#qN.mh+24) ]]; then
  compinit -d "$_zcompdump"
else
  compinit -C -d "$_zcompdump"
fi
unset _zcompdump

# Load named colours (needed by the completion format strings below).
autoload -Uz colors && colors

# Enable which completion methods will be used.
zstyle ':completion:*' completer _extensions _complete _approximate

# Enable caching of completion results.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# Enable completion menu.
zstyle ':completion:*' menu select

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
zstyle :compinstall filename "$XDG_CONFIG_HOME/zsh/.zshrc"
