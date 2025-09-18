#!/bin/zsh





seagate="/Volumes/Seagate 4TB"
if [[ -d $seagate ]]; then
    if mount | grep -q "$seagate" && mount | grep "$seagate" | grep -Eq 'smbfs|afpfs|nfs'; then
        seagate_storage=$(osascript $HOME/.dotfiles/tmux/seagate-usage-networkversion.applescript)
    else
        seagate_storage=$(osascript $HOME/.dotfiles/tmux/seagate-usage.applescript)
    fi

    echo "$seagate_storage"

fi
