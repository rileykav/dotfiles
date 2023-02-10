#primary-session.tmux

rename-window "Main"
split-window -v -p 50
split-window -h -p 50
select-pane -t 0
split-window -h -p 50
new-window -n "Vim"
split-window -v -p 20
select-pane -t 0
new-window -n "Other"
split-window -v -p 20
split-window -h -p 50
select-pane -t 0
new-window -n "music"
split-window -h -p 50
select-pane -t 0
new-window -n "dotfiles
send-keys "cd ~/.dotfiles && clear" enter
split-window -v -p 25
select-pane -t 0
select-window -t 0
select-pane -t 0
