# ── Special helper functions ────────────────────────────────────────

# Extract various archive formats
extract() {
    for archive in "$@"; do
        if [ -f "$archive" ]; then
            case $archive in
                *.tar.bz2)   tar xvjf "$archive" ;;
                *.tar.gz)    tar xvzf "$archive" ;;
                *.bz2)       bunzip2 "$archive" ;;
                *.rar)       rar x "$archive" ;;
                *.gz)        gunzip "$archive" ;;
                *.tar)       tar xvf "$archive" ;;
                *.tbz2)      tar xvjf "$archive" ;;
                *.tgz)       tar xvzf "$archive" ;;
                *.zip)       unzip "$archive" ;;
                *.Z)         uncompress "$archive" ;;
                *.7z)        7z x "$archive" ;;
                *)           echo "don't know how to extract '$archive'..." ;;
            esac
        else
            echo "'$archive' is not a valid file!"
        fi
    done
}

# Copy with progress (uses pv if available, falls back to cp)
cpp() {
    if [[ -z $1 || -z $2 ]]; then
        echo "Usage: cpp SOURCE DEST"
        return 1
    fi
    if command -v pv &> /dev/null; then
        pv --progress --eta --bytes "$1" > "$2"
    else
        cp --reflink=auto --preserve=all --verbose "$1" "$2"
    fi
}

# Show OS-release and kernel info
ver() {
    cat /etc/os-release
    uname -a
}

# Trim leading/trailing whitespace from its arguments
trim() {
    local var="$*"
    var="${var#"${var%%[![:space:]]*}"}"
    var="${var%"${var##*[![:space:]]}"}"
    printf '%s' "$var"
}

# Show internal & external IP addresses
whatsmyip() {
    # Internal IP
    local iface
    iface=$(ip route get 1.1.1.1 2>/dev/null \
        | awk '/dev/ {print $5; exit}')
    if [[ -n $iface ]]; then
        printf "Internal IP (%s): " "$iface"
        ip -4 addr show dev "$iface" \
            | awk '/inet / {print $2}' \
            | cut -d/ -f1
    else
        echo "Internal IP: interface not found"
    fi

    # External IP
    printf "External IP: "
    curl -4 ifconfig.me
}

# Install support packages via paru (or pacman fallback)
install_bashrc_support() {
    local pkgs=(
        multitail
        tree
        trash-cli
        fzf
        bash-completion
        fastfetch
        pv
        zoxide
        starship
    )

    if command -v paru &> /dev/null; then
        echo "Installing support packages via paru…"
        paru -Sy --needed "${pkgs[@]}"
    else
        echo "paru not found, installing via pacman…"
        sudo pacman -Sy --needed "${pkgs[@]}"
    fi
}

