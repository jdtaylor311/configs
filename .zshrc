# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

alias esp32="source ~/esp/esp-idf/export.sh"
alias python="python3"
alias vim="nvim"
alias ls="ls -al"

export PATH="$HOME/.espressif/tools/riscv32-esp-elf/esp-2022r1-11.2.0/riscv32-esp-elf/bin:$PATH"
export PATH="$HOME/.espressif/tools/openocd-esp32/v0.11.0-esp32-20221026/openocd-esp32/bin:$PATH"
export PATH="~/.local/bin:$PATH"
export PATH="$HOME/flutter/bin:$PATH"
export PATH="/opt/homebrew/bin/:$PATH"
export AIRFLOW_HOME=~/airflow


export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"

export ZEPHYR_SDK_INSTALL_DIR="$HOME/zephyr-sdk-0.15.0"
export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
export ZEPHYR_BASE="$HOME/zmk/zephyr"

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

eval "$(starship init zsh)"
complete -C '/usr/local/bin/aws_completer' aws
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source ~/.iterm2_shell_integration.zsh
