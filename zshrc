# dircolors
if [ -f "${HOME}/.config/shell/dircolors" ]; then
    eval $(dircolors -b "${HOME}/.config/shell/dircolors")
elif [ -f "/etc/dircolors.d/dircolors.256dark" ]; then
    eval $(dircolors -b "/etc/dircolors.d/dircolors.256dark")
fi

# Prepend user-specific bin/ paths
if [ -d "${HOME}/.bin" ]; then
    PATH="${HOME}/.bin:${PATH}"
fi

# Extract an archive
function extract () {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)      tar xjf "$1"                    ;;
            *.tar.gz)       tar xzf "$1"                    ;;
            *.bz2)          bunzip2 "$1"                    ;;
            *.rar)          unrar x "$1"                    ;;
            *.gz)           gunzip "$1"                     ;;
            *.tar)          tar xf "$1"                     ;;
            *.tbz2)         tar xjf "$1"                    ;;
            *.tgz)          tar xzf "$1"                    ;;
            *.zip)          unzip "$1"                      ;;
            *.Z)            uncompress "$1"                 ;;
            *.rpm)          rpm2cpio "$1" | bsdtar -xf -    ;;
            *)              echo "'$1' cannot be extracted via extract()" ;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# extended output for `time' command
TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M MB'$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'

# Useful commands
alias ls='/bin/ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=always -F'
alias ll='ls -lsh'
alias la='ll -a'
alias lsd='ll -t'

alias grep='grep --color=always -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias du='du -h'
alias free='free -m'                      # show sizes in MB

# NeoVim & VIm
alias n='nvim'
alias nsu='sudo -E nvim'
alias visu='sudo -E vim'

# Git
alias glg='git lg'
alias glga='git lga'
alias gst='git st'
alias gg='git get'
alias gdx='git dx'

# lsblk
alias lsblk='lsblk -o SIZE,NAME,VENDOR,MODEL,LABEL,FSTYPE,RO,TYPE,MOUNTPOINT,UUID'

# random password generator
function genpasswd() {
    tr -cd '[:alnum:]' < /dev/urandom|head -c $1
}
