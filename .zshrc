# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

export ZSH="/home/jan/.oh-my-zsh"

#ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_CUSTOM=/usr/share/zsh

# Plusing
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh


# User configuration

#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source ~/.profile

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases
alias todo="todo.sh"
alias todols="todo.sh ls"
alias todoadd="todo.sh add"
alias ll="ls -gGh --group-directories-first"
alias cal="calcurse"

eval "$(starship init zsh)"

