# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

alias python="python3"
alias vim="nvim"
alias ls="ls -al"

if [ -d "/snap/bin" ]; then
    export PATH="/snap/bin:$PATH"
fi
export PATH="~/.local/bin:$PATH"

if [ -d "/opt/homebrew/bin" ]; then
    export PATH="/opt/homebrew/bin/:$PATH"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -U +X compinit && compinit
  autoload bashcompinit && bashcompinit
  source $(brew --prefix)/etc/bash_completion.d/az
fi

if test -d "usr/local/bin/aws_completer"; then
    complete -C '/usr/local/bin/aws_completer' aws
fi

eval "$(starship init zsh)"

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
