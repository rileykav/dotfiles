PATH="/Users/riley/.rbenv/shims:/Users/riley/.rbenv/bin:/Users/riley/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/opt/X11/bin:/Library/Apple/usr/bin:/Users/riley/opt/anaconda3/condabin:/Users/riley/.rbenv/shims:/Users/riley/.rbenv/bin"
rclone -P sync $HOME/Utrecht/ mydrive:Utrecht --filter-from $HOME/.dotfiles/rclone/filter-list.txt &> /dev/null
osascript "$HOME/.dotfiles/automator/sync-uu.scpt"
