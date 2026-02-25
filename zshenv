# vim: set filetype=zsh:

ZSHENV_SECRETS_FILE="${HOME}/.secrets.zshenv"

export DEFAULT_USER=$(whoami)
export TERMINAL=/usr/bin/wezterm

if type nvim > /dev/null;
then
    export EDITOR=nvim
elif type vim > /dev/null;
then
    export EDITOR=vim
fi

if type bat > /dev/null;
then
    export PAGER=bat
elif type batcat > /dev/null;
then
    # Install local `bat` to invoke `batcat`
    if [ ! -f "${HOME}/.local/bin/bat" ];
    then
        cat >> "${HOME}/.local/bin/bat" <<'EOF'
#!/bin/bash
/bin/batcat "$@"
EOF
        chmod a+x "${HOME}/.local/bin/bat"
    fi
    export PAGER=bat
fi

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
export ANDROID_HOME=/opt/android-sdk
export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
export PYTHONIOENCODING=utf-8
export GPG_TTY=$(tty)  # see https://github.com/keybase/keybase-issues/issues/2798

# PATH
export PATH="${HOME}/.cargo/bin:$PATH:${HOME}/.local/share/gem/ruby/3.0.0/bin:${HOME}/.local/node_modules/.bin:${HOME}/.local/share/coursier/bin"

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

export DIFFPROG=nvimdiff # our thin wrapper around nvim

if [ -f "$ZSHENV_SECRETS_FILE" ]
then
    # Warn if file is readable/writable by other users
    if [[ "$OSTYPE" == darwin* ]]; then
        _secrets_perms=$(stat -f '%A' "$ZSHENV_SECRETS_FILE")
    else
        _secrets_perms=$(stat -c '%a' "$ZSHENV_SECRETS_FILE")
    fi
    if [[ "$_secrets_perms" =~ [0-7][^0][0-7]$ || "$_secrets_perms" =~ [0-7][0-7][^0]$ ]]; then
        echo "WARNING: $ZSHENV_SECRETS_FILE is accessible by other users. Consider running: chmod 600 $ZSHENV_SECRETS_FILE" >&2
    fi
    unset _secrets_perms
    source "$ZSHENV_SECRETS_FILE"
fi
