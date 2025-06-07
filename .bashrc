#   _               _
#  | |__   __ _ ___| |__  _ __ ___
#  | '_ \ / _` / __| '_ \| '__/ __|
#  | |_) | (_| \__ \ | | | | | (__
#  |_.__/ \__,_|___/_| |_|_|  \___|
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
################################################################################
PF_INFO="ascii title os kernel wm uptime pkgs memory" pfetch

export EDITOR=nvim

# Ignore duplicate commands when scrolling through history
export HISTCONTROL=ignoreboth:erasedups

###---Aliases---###
alias vi='nvim'
alias grep='grep --color=auto'
alias yt-dlp='yt-dlp --merge-output-format mkv'
alias sz='du -sch'
alias mkdir='mkdir -p'
alias wifistatus='nmcli dev status'
alias wifilist='nmcli d wifi list'
alias wificonnect='sudo nmcli --ask dev wifi connect'
alias wifion='nmcli radio wifi on'
alias wifioff='nmcli radio wifi off'

###---MyScripts---###
export PATH="$PATH:/home/andrew/Scripts/Bash_Scripts/"

###---SSH---###
# Pihole
alias pihole='ssh 192.168.86.76 -l andrew' # ssh <ip_address> -l <username>

###---Pacman---###
alias removeorph='sudo pacman -Qtdq | sudo pacman -Rns - '

###---Git---###
alias config='git --git-dir=$HOME/Scripts/dotfiles --work-tree=$HOME'
alias ?='gh copilot explain'
alias ??='gh copilot suggest'
alias copilotupdate='gh extension upgrade gh-copilot'

###---Rust Packages---###
alias ls='exa --color=always --group-directories-first -l --color-scale size -m --no-user'  # Default listing
alias la='exa -al --color=always --group-directories-first'  # All files and dirs
alias lt='exa -aT --color=always --group-directories-first'  # Tree listing
alias cat='bat'
# alias find='fd'
alias du='dust'

###---Starship Prompt---###
eval "$(starship init bash)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
