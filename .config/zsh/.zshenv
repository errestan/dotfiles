# Set default text editor.
EDITOR=nvim

# Android NDK toolchain path(s).
ANDROID_NDK="/opt/android"
ANDROID_NDK_32="$ANDROID_NDK/current-arm32/bin"
ANDROID_NDK_64="$ANDROID_NDK/current-arm64/bin"

# If a 32-bit NDK is present add it to the $PATH.
[ -d "$ANDROID_NDK/current-arm32" ] && export PATH="$PATH:$ANDROID_NDK_32"

# If a 64-bit NDK is present add it to the $PATH.
[ -d "$ANDROID_NDK/current-arm64" ] && export PATH="$PATH:$ANDROID_NDK_64"

# Set PATH so it includes user's private binary directory if it exists
[ -d "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin"

# Coloured GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Setup some XDG variables.
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# Change where ZSH looks for its dot files.export ZDOTDIR="${${(%):-%x}:P:h}"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Enable experimental worker thread support in NodeJS.
export NODE_OPTIONS="--experimental-worker"

# Let GPG Agent handle SSH keys.
if [ -f "${HOME}/.gpg-agent-info" ]; then
     . "${HOME}/.gpg-agent-info"
     export GPG_AGENT_INFO
     export SSH_AUTH_SOCK
     export SSH_AGENT_PID
 else
     export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
fi

# Source local ZSH environment configuration.
[ -f "$ZDOTDIR/.zshenv.local" ] && source "$ZDOTDIR/.zshenv.local"
