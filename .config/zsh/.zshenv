# Change where zsh looks for dot files to the directory containing the target
# of the ".zshenv" symbolic link. Note: This is a crazy expression from Redit!
export ZDOTDIR="${${(%):-%x}:P:h}"

# Android NDK toolchain path(s).
ANDROID_NDK="/opt/android"
ANDROID_NDK_32="$ANDROID_NDK/current-arm32/bin"
ANDROID_NDK_64="$ANDROID_NDK/current-arm64/bin"

# If a 32-bit NDK is present add it to the $PATH.
[ -d "$ANDROID_NDK/current-arm32" ] && export PATH="$ANDROID_NDK_32:$PATH"

# If a 64-bit NDK is present add it to the $PATH.
[ -d "$ANDROID_NDK/current-arm64" ] &&  export PATH="$ANDROID_NDK_64:$PATH"

# Let GPG Agent handle SSH keys.
if [ -f "${HOME}/.gpg-agent-info" ]; then
     . "${HOME}/.gpg-agent-info"
     export GPG_AGENT_INFO
     export SSH_AUTH_SOCK
     export SSH_AGENT_PID
fi

# Coloured GCC warnings and errors
GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Set FZF path.
FZF_ZSH_PATH="/usr/share/doc/fzf/examples/key-bindings.zsh"

# Set PATH so it includes user's private binary directory if it exists
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

# If present source a local ZSH environment file.
ZSHENV_LOCAL="$ZDOTDIR/.zshenv.local"
[ -f "$ZSHENV_LOCAL" ] && . $ZSHENV_LOCAL
