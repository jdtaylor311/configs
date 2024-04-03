# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

alias python="python3"
alias vim="nvim"
alias ls="ls -al"

if test -d "/snap/bin"; then
    export PATH="/snap/bin:$PATH"
fi
export PATH="~/.local/bin:$PATH"
export PATH="/opt/homebrew/bin/:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload bashcompinit && bashcompinit
source $(brew --prefix)/etc/bash_completion.d/az
  autoload -Uz compinit
  compinit
fi

if test -d "usr/local/bin/aws_completer"; then
    complete -C '/usr/local/bin/aws_completer' aws
fi

eval "$(starship init zsh)"

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
