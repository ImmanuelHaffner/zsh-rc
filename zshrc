# Path to your oh-my-zsh configuration.
ZSH=/usr/share/oh-my-zsh/


#===============================================================================
#
#   Stuff to do before Zsh config gets sourced
#
#===============================================================================

#========================
# Use dircolors
#========================

# Specify path to default dircolors
DIRCOLORS_PATH="/etc/dircolors.d/dircolors.256dark"

# Use user-specific dircolors if available
if [ -f "${HOME}/.config/shell/dircolors" ]
then
  echo "found user-specific dircolors for ${HOME}"
  DIRCOLORS_PATH="${HOME}/.config/shell/dircolors"
fi

if [ -f "${DIRCOLORS_PATH}" ]
then
  eval $(dircolors -b "${DIRCOLORS_PATH}")
else
  echo "no dircolors found at ${DIRCOLORS_PATH}"
fi

#[[ ${TERM} != "linux" && -f ${HOME}/.config/shell/dircolors ]] && eval $(dircolors -b ${HOME}/.config/shell/dircolors)




# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
#DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
#COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# per-directory-history
plugins=(git git-extras gitfast themes archlinux battery cp history compleat)

source $ZSH/oh-my-zsh.sh

#========================
# Prepend user-specific bin/ paths
#========================
if [ -d "${HOME}/.bin" ]
then
  PATH="${HOME}/.bin:${PATH}"
fi

#========================
# Miscellanneous
#========================

alias ls='/usr/bin/ls -C --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=always -F'
alias ll='/usr/bin/ls -lsh --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=always -F'
alias la='/usr/bin/ls -lash --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=always -F'
# List by date
alias lsd='/usr/bin/ls -lsth --time-style=+"%d.%m.%Y %H:%M" --color=always -c -F'

alias grep='grep --color=always -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias vp='vim PKGBUILD'
alias vs='vim SPLITBUILD'

# vim stuff
export EDITOR=vim
export DIFF=vimdiff
export VISUAL=vim
alias vi=vim
alias view='vim -R'

#========================
# Create new directory and cd into it
#========================
alias md='__make_and_change_directory'

__make_and_change_directory() {
    for v in "$@"
    do
        mkdir "$v"
        cd "$v"
    done
}

#========================
# Extract an archive
#========================
extract () {
  if [ -f $1 ] ; then
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


#========================
# Source user-specific .zshrc files
#========================
if [ -f "$HOME/.zshrc" ]
then
  source "$HOME/.zshrc"
fi
