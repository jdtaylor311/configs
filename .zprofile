emulate sh
source ~/.profile
emulate zsh

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(/opt/homebrew/bin/brew shellenv)"
# Add .NET Core SDK tools
export PATH="$PATH:/Users/joshuataylor/.dotnet/tools"

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :


# Added by Toolbox App
export PATH="$PATH:/Users/joshuataylor/Library/Application Support/JetBrains/Toolbox/scripts"

