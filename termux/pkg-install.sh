#/data/data/com.termux/files/usr/bin/bash
core_install_list=(
    coreutils
    termux-services
    termux-api
    man
    vim
    zsh
    tmux
    python # Don't think you need to specifiy name
    git
)


more_install_list=(
    openssh
    nmap
)


pkg install $core_install_list -y
