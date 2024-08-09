export ZSH=$HOME/.zsh
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
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

# source ~/qmk_firmware/util/qmk_tab_complete.sh

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
eval "$(starship init zsh)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
