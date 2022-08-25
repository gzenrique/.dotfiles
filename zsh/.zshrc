# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="/usr/local/opt/openssl@3/bin:$HOME/go/bin:/usr/local/bin:$PATH"

# Set Meta modifiers
# Run `cat` then press keys to see the codes your shortcut send
bindkey "^[[1;2D" backward-word
bindkey "^[[1;2C" forward-word

export GPG_TTY=$TTY

export PATH="/usr/local/opt/python@3.9/Frameworks/Python.framework/Versions/3.9/bin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="~/bin:$PATH"


##########################
# Oh My Zsh configuration
##########################

# Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Show command execution time stamp in the history command output.
HIST_STAMPS="%d-%m-%y %T"

# Use hyphen-insensitive completion. Case sensitive completion must be off.
# _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  git
  dotenv
  kubectl
)

# Custom plugins' configuration

ZSH_DOTENV_FILE=.dotenv

ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh

# Conflicts with 'ksd' binary
unalias ksd

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
