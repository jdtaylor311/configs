#!/bin/bash
source ~/.profile
emulate zsh

# Set PATH, MANPATH, etc., for Homebrew.
if  test -d "/opt/homebrew/bin/brew"; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
