#primary-session.tmux

rename-window "Main"
split-window -v -p 50
split-window -h -p 50
select-pane -t 0
split-window -h -p 50
new-window -n "music"
split-window -h -p 25
split-window -v -p 25
select-pane -t 0
new-window -n "dotfiles"
send-keys "cd ~/.dotfiles && clear" enter
new-window -n "diary"
send-keys "vim ~/current.txt" enter
select-window -t 0
select-pane -t 0
