# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.cargo/bin
# export PATH=$PATH:~/scripts

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
alias btr="bluetoothctl info | awk '/Battery Percentage/ {gsub(/[^0-9]+/, \"\", \$NF); print \$1, \$2 \" \" \$NF \"%\"}'"


#If one experiences no audio output via any means while using ALSA, attempt to unmute the sound card. To do this, launch alsamixer and make sure each column has a green 00 under it (this can be toggled by pressing m): https://wiki.archlinux.org/title/PulseAudio/Troubleshooting
alias mixer="alsamixer -c 0"
alias fixtearing="xrandr --output eDP --set TearFree on"
alias cfont="fc-cache -fv"
alias mountbj="sudo mount --mkdir /dev/sdb2 /run/media/bj-pieri/Benjamin"
alias umountbj="sudo umount -v /run/media/bj-pieri/Benjamin"
alias stdhd="ranger /run/media/bj-pieri/Benjamin"
alias std="ranger ~/Documents/Central/Study/CS/"
alias cleanswap="rm -rf ~/.local/state/nvim/swap"
alias us="setxkbmap us"
alias br="setxkbmap br"
alias acento="setxkbmap -option compose:ralt"
alias wifi="nmtui"
alias vboxforce="sudo modprobe vboxdrv"
alias vboxnet="sudo modprobe vboxnetflt"
alias javinha="zathura ~/Documents/Central/Study/CS/Java/Introduction\ to\ Java\ Programming\ and\ Data\ Structures,\ Comprehensive\ Version\ \(Y.\ Daniel\ Liang\)\ \(z-lib.org\).pdf & disown"
alias kurose="zathura ~/Documents/Central/Study/CS/Redes/James\ Kurose,\ Keith\ Ross\ -\ Computer\ Networking-Pearson\ \(2021\).pdf &  disown"
alias unixin=" zathura ~/Documents/Central/Study/CS/Gnu-Linux/2017\ Nemeth\ Evi\ etal\ -\ UNIX\ and\ Linux\ System\ Administration\ Handbook\[5thED\]_Rell.pdf & disown"
alias sala="xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-0 --mode 1920x1080 --pos 1920x0 --rotate normal"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
# source ~/.rvm/scripts/rvm
# export PATH="$PATH:$HOME/.local/bin"

#. $HOME/.asdf/asdf.sh
#export PATH="$PATH:/usr/lib/dart/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(mcfly init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# bun completions
[ -s "/home/bj-pieri/.bun/_bun" ] && source "/home/bj-pieri/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
