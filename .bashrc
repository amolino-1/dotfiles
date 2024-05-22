#   _               _
#  | |__   __ _ ___| |__  _ __ ___
#  | '_ \ / _` / __| '_ \| '__/ __|
#  | |_) | (_| \__ \ | | | | | (__
#  |_.__/ \__,_|___/_| |_|_|  \___|
#

# ~/.bashrc
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
alias glances='glances --disable-bg'
alias stream='less -S +F'
alias wifistatus='nmcli dev status'
alias wifilist='nmcli d wifi list'
alias wificonnect='sudo nmcli --ask dev wifi connect'
alias wifion='nmcli radio wifi on'
alias wifioff='nmcli radio wifi off'

###---MyScripts---###
export PATH="$PATH:/home/andrew/Scripts/Bash_Scripts/"

###---SSH---###
# Gadi
alias gadi='ssh axm572@gadi.nci.org.au'
alias mountgadi='sshfs axm572@gadi.nci.org.au:/scratch/k02/axm572 /home/andrew/Work/Gadi -o cache=yes,kernel_cache,Ciphers=aes128-ctr,Compression=no'
alias unmountgadi='cd && fusermount3 -u /home/andrew/Work/Gadi'
# Engaging
alias engaging='ssh amolino@eofe10.mit.edu'
alias mountengaging='sshfs amolino@eofe10.mit.edu: /home/andrew/Work/Engaging/ -o cache=yes,kernel_cache,Ciphers=aes128-ctr,Compression=no'
alias unmountengaging='cd && fusermount3 -u /home/andrew/Work/Engaging'
# Supercloud
alias supercloud='ssh amolino@txe1-login.mit.edu'
alias mountsupercloud='sshfs amolino@txe1-login.mit.edu: /home/andrew/Work/SuperCloud -o cache=yes,kernel_cache,Ciphers=aes128-ctr,Compression=no'
alias unmountsupercloud='cd && fusermount3 -u /home/andrew/Work/SuperCloud'
# Athena
alias athena='ssh -X -Y athena.dialup.mit.edu -l amolino'
# Pihole
alias pihole='ssh 192.168.50.203 -l andrew' # ssh <ip_address> -l <username>

###---VPN---###
alias MITvpn='gpclient launch-gui & disown'

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
alias find='fd'
alias du='dust'

###---FZF---####
alias fzf='fzf --preview="bat --color=always --style=numbers {}" --bind shift-up:preview-page-up,shift-down:preview-page-down'

###---Chemcraft---###
alias chemcraft='flatpak run --command=bottles-cli com.usebottles.bottles run -b Chemcraft -e ~/.var/app/com.usebottles.bottles/data/bottles/bottles/Chemcraft/drive_c/Chemcraft/Chemcraft.exe'

###---IboView---###
alias iboview='flatpak run --command=bottles-cli com.usebottles.bottles run -b Chemcraft -e /home/andrew/Software/iboView_Version20211019RevA/bin/IboView.exe'

###---Gaussian---###
export g16root="$HOME/Software/Gaussian"
export GAUSS_EXEDIR=$g16root/g16
export GAUSS_SCRDIR=$g16root/scr
alias g16='$GAUSS_EXEDIR/g16'
alias gview="/home/andrew/Software/gview/gv/gv & disown"

###---ACID---###
export PATH=$PATH:/home/andrew/Software/povchem
export PATH=$PATH:/home/andrew/Software/AICD-3.0.2

###---Starship Prompt---###
eval "$(starship init bash)"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/andrew/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/andrew/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<
