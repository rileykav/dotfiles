#utrecht-session.tmux

rename-window "Paper"
send-keys "cd '$HOME/Utrecht/NS-TP551 - Masters Thesis/Project Code/Paper Draft' && clear" enter
split-window -v -p 10
select-pane -t 0
resize-pane -Z
new-window -n "Git"
send-keys "cd '$HOME/Utrecht/NS-TP551 - Masters Thesis/Project Code' && clear" enter
split-window -v -p 10
split-window -h -p 50
select-pane -t 0
new-window -n "PhD Applications"
send-keys "cd '$HOME/Utrecht/General/Phd Applications' && clear" enter
split-window -v -p 10
split-window -h -p 50
select-pane -t 0
new-window -n "Coding"
send-keys "cd '$HOME/Coding' && clear" enter
split-window -v -p 10
split-window -h -p 50
select-pane -t 0
new-window -n "Other"
split-window -h -p 50
select-pane -t 0
select-window -t 0
select-pane -t 0
