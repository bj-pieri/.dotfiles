# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:~/.local/bin

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

#ALIASES
alias nvimd="neovide"
alias lg="lazygit"

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export EDITOR=nvim

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias btr='pacmd ls | grep bluetooth.battery' 

#If one experiences no audio output via any means while using ALSA, attempt to unmute the sound card. To do this, launch alsamixer and make sure each column has a green 00 under it (this can be toggled by pressing m): https://wiki.archlinux.org/title/PulseAudio/Troubleshooting
alias mixer="alsamixer -c 0"
alias std="ranger ~/Documents/central/Study/CS/"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
# source ~/.rvm/scripts/rvm
# export PATH="$PATH:$HOME/.local/bin"

. $HOME/.asdf/asdf.sh
#export PATH="$PATH:/usr/lib/dart/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(mcfly init zsh)"

source ~/powerlevel10k/powerlevel10k.zsh-theme
