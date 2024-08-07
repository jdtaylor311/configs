#!/bin/bash
source ~/.profile
emulate zsh

# Set PATH, MANPATH, etc., for Homebrew.
if  test -d "/opt/homebrew/bin/brew"; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# >>> coursier install directory >>>
export PATH="$PATH:/Users/jdtaylor311/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<
export PATH="$PATH:/Users/jdtaylor311/.dotnet/tools"
