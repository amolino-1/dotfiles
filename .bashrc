#   _               _
#  | |__   __ _ ___| |__  _ __ ___
#  | '_ \ / _` / __| '_ \| '__/ __|
#  | |_) | (_| \__ \ | | | | | (__
#  |_.__/ \__,_|___/_| |_|_|_|  \___|
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ── Environment & Paths ────────────────────────────────────────────────────────
export EDITOR=nvim

# XDG directories
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Extend PATH in one place
for d in "$HOME/.local/bin" "$HOME/Scripts/Bash_Scripts"; do
    [[ -d $d ]] && PATH="$PATH:$d"
done
export PATH

# ── History Configuration ───────────────────────────────────────────────────────
shopt -s histappend cmdhist
export HISTFILESIZE=10000
export HISTSIZE=500
export HISTCONTROL=ignoredups:erasedups
export HISTTIMEFORMAT="%F %T"          # add timestamp to history
PROMPT_COMMAND='history -a; history -n'

# ── Window Size & Key Bindings ──────────────────────────────────────────────────
shopt -s checkwinsize
[[ $- == *i* ]] && stty -ixon

# ── Prompt & Theme ─────────────────────────────────────────────────────────────
if command -v starship &>/dev/null; then
    eval "$(starship init bash)"
fi

# ── Programmable Completion ─────────────────────────────────────────────────────
if [[ -z "${_BASH_COMPLETION_LOADED:-}" ]]; then
    source /usr/share/bash-completion/bash_completion 2>/dev/null \
      || source /etc/bash_completion 2>/dev/null
    export _BASH_COMPLETION_LOADED=1
fi

# fzf (fuzzy finder) integration
if command -v fzf &> /dev/null; then
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
fi

# zoxide (fast directory jumping)
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init bash)"
fi

# ── Load User Aliases ──────────────────────────────────────────────────────────
if [[ -f ~/.bash_aliases ]]; then
    source ~/.bash_aliases
fi

# ── Fastfetch System Summary ──────────────────────────────────────────────────
# if command -v fastfetch &>/dev/null; then
#     ffetch
# fi

# ── Bell & Readline Tweaks ─────────────────────────────────────────────────────
if [[ $- == *i* ]]; then
  bind "set bell-style visible"
  bind "set show-all-if-ambiguous On"
  bind "set completion-ignore-case on"

  # ↑/↓ search history by what you've already typed
  bind '"\e[A": history-search-backward'
  bind '"\e[B": history-search-forward'
fi

# ── Manpage Colors ─────────────────────────────────────────────────────────────
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# ── Load Special Functions ─────────────────────────────────────────
if [[ -f ~/.bash_functions ]]; then
    source ~/.bash_functions
fi
