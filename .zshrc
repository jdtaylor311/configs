export ZSH=$HOME/.zsh
# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/development/flutter/bin:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

alias python="python3"
alias vim="nvim"
alias ls="ls -al"

# if [ -d "/snap/bin" ]; then
# 	export PATH="/snap/bin:$PATH"
# fi
export PATH="~/.local/bin:$PATH"

if [ -d "/opt/homebrew/bin" ]; then
	export PATH="/opt/homebrew/bin/:$PATH"
fi

if type brew &>/dev/null; then
	FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
	autoload -U +X compinit && compinit
	autoload bashcompinit && bashcompinit
	source "$(brew --prefix)"/etc/bash_completion.d/az
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# zsh parameter completion for the dotnet CLI
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  # If the completion list is empty, just continue with filename selection
  if [ -z "$completions" ]
  then
    _arguments '*::arguments: _normal'
    return
  fi

  # This is not a variable assignment, don't remove spaces!
  _values = "${(ps:\n:)completions}"
}
compdef _dotnet_zsh_complete dotnet

export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
eval "$(fnm env --use-on-cd)"
. "$HOME/.cargo/env"

# source ~/qmk_firmware/util/qmk_tab_complete.sh

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/jdtaylor311/.opam/opam-init/init.zsh' ]] || source '/Users/jdtaylor311/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

# bun completions
[ -s "/Users/jdtaylor311/.bun/_bun" ] && source "/Users/jdtaylor311/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
