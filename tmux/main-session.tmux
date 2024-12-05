#utrecht-session.tmux

rename-window "Paper"
send-keys "cd '$HOME/Utrecht/NS-TP551 - Masters Thesis/Project Code/Paper Draft' && clear" enter
split-window -v -l 10%
select-pane -t 0
resize-pane -Z
new-window -n "Git"
send-keys "cd '$HOME/Utrecht/NS-TP551 - Masters Thesis/Project Code' && clear" enter
split-window -v -l 10%
split-window -h -l 50%
select-pane -t 0
new-window -n "Other"
send-keys "cd '$HOME' && clear" enter
split-window -v -l 10%
split-window -h -l 50%
select-pane -t 0
split-window -v -l 10%
split-window -h -l 50%
select-pane -t 0
select-window -t 0
