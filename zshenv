# vim: set filetype=zsh:

export DEFAULT_USER=immanuel
export TERMINAL=/usr/bin/wezterm
export EDITOR=nvim
export PAGER=bat
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
export ANDROID_HOME=/opt/android-sdk
export PYTHONIOENCODING=utf-8
export GPG_TTY=$(tty)  # see https://github.com/keybase/keybase-issues/issues/2798

# PATH
export PATH="${HOME}/.cargo/bin:$PATH:${HOME}/.local/share/gem/ruby/3.0.0/bin:${HOME}/.local/node_modules/.bin"

# Add local bin to $PATH
if [ -d "${HOME}/.local/bin" ]; then
    export PATH="${HOME}/.local/bin:${PATH}"
fi


# Enable DPI scaling for QT apps
export QT_SCALE_FACTOR=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# Ninja
export NINJA_STATUS="[%p|%s/%t|%es] "

# GPerfTools
export CPUPROFILE_FREQUENCY=100000
