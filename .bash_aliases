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

###---Fastfetch Wrapper---###
alias ffetch="$HOME/.config/fastfetch/ffetch.py"

###---Grep (ripgrep fallback)---###
if command -v rg &> /dev/null; then
    alias grep='rg'
else
    alias grep="/usr/bin/grep \$GREP_OPTIONS"
fi
unset GREP_OPTIONS

###---History Search---###
alias h="history | grep "

###---File Count---###
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

###---IP Lookup---###
alias whatismyip="whatsmyip"

