#   _               _
#  | |__   __ _ ___| |__  _ __ ___
#  | '_ \ / _` / __| '_ \| '__/ __|
#  | |_) | (_| \__ \ | | | | | (__
#  |_.__/ \__,_|___/_| |_|_|  \___|
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ── Prompt ────────────────────────────────────────────────────────────────────
PS1='[\u@\h \W]\$ '

# ── pfetch system summary ─────────────────────────────────────────────────────
PF_INFO="ascii title os kernel wm uptime pkgs memory" pfetch

# ── Editor ────────────────────────────────────────────────────────────────────
export EDITOR=nvim

# ── History ───────────────────────────────────────────────────────────────────
export HISTCONTROL=ignoreboth:erasedups

# ── Scripts ───────────────────────────────────────────────────────────────────
export PATH="$PATH:/home/andrew/Scripts/Bash_Scripts/"

# ── Load user aliases (kept in ~/.bash_aliases) ───────────────────────────
if [[ -f ~/.bash_aliases ]]; then
    source ~/.bash_aliases
fi

# ── Starship prompt initialisation ───────────────────────────────────────────
eval "$(starship init bash)"

