# dircolors
if [ -f "${HOME}/.config/shell/dircolors" ]; then
    eval $(dircolors -b "${HOME}/.config/shell/dircolors")
elif [ -f "/etc/dircolors.d/dircolors.256dark" ]; then
    eval $(dircolors -b "/etc/dircolors.d/dircolors.256dark")
fi

# syntax highlighting
if [ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# Prepend user-specific bin/ paths
if [ -d "${HOME}/.bin" ]; then
    PATH="${HOME}/.bin:${PATH}"
fi

# Extract an archive
function extract () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)        tar xjf $1        ;;
            *.tar.gz)         tar xzf $1        ;;
            *.bz2)            bunzip2 $1        ;;
            *.rar)            unrar x $1        ;;
            *.gz)             gunzip $1         ;;
            *.tar)            tar xf $1         ;;
            *.tbz2)           tar xjf $1        ;;
            *.tgz)            tar xzf $1        ;;
            *.zip)            unzip $1          ;;
            *.Z)              uncompress $1     ;;
            *)                echo "'$1' cannot be extracted via extract()" ;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Source user-specific .zshrc files
#if [ -f "${HOME}/.zshrc" ]; then
    #source "${HOME}/.zshrc"
#fi
