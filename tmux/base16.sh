#Base16 Styling Guidlines
# Source: [vim + tmux - OMG!Code](https://youtu.be/5r6yzFEXajQ?si=rufoPP1SpBgl_d4k)




base00=default      # - Default
base01='#151515'    # - Lighter Background (Used for statubars)
base02='#202020'    # - Selection Background
base03='#909090'    # - Comments, Invisibles, Line Highlighting
base04='#505050'    # - Dark Foreground (Used for status bars)
base05='#D0D0D0'    # - Default Foreground, Caret, Delimiters, Operators
base06='#E0E0E0'    # - Light Foreground (Not often used)
base07='#F5F5F5'    # - Light Background (Not often used)
base08='#AC4142'    # - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
base09='#D28445'    # - Integers, Boolean, Constants, XML Attributes, Markup Link Url
base0A='#F4BF75'    # - Classes, Markup Bold, Search Text Background
base0B='#90A959'    # - Strings, Inherited Class, Markup Code, Diff Inserted
base0C='#75B5AA'    # - Support, Regular Expressions, Escape Characters, Markup Quotes
base0D='#6A9FB5'    # - Functions, Methods, Attribute IDs, Headings
base0E='#AA759F'    # - Keywords, Storage, Selector, Markup Italic, Diff Changed
base0F='#8F5536'    # - Deprecated, Opening/Closing Embedded Language Tags, e.g. <? php ?>

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

# default statusbar colours
set-option -g status-style fg=$base02,bg=$base00,default

set-window-option -g window-status-style fg=$base03,bg=$base00
set-window-option -g window-status-format " #I #W"

#set -g default-terminal "screen-256colour"



# clock
set-window-option -g clock-mode-colour $base03

tm_session_name="#[default,bg=$base00,fg=$base0E] #S "
set -g status-left "$tm_session_name"



tm_tunes="#[bg=$base00,fg=$base0D] ♫ #(osascript -l JavaScript ~/.dotfiles/tmux/tunes.js)"
#tm_music="#[bg=$base00,fg=$base0D] ⚢ #(osascript ~/.dotfiles/tmux/current-track.applescript)"
# tm_music="#[bg=$base00,fg=$base0D] ◭ #(osascript -l JavaScript ~/.dotfiles/tmux/vlc.js)"
# tm_music="#[bg=$base00,fg=$base0D] #(osascript -l JavaScript ~/.dotfiles/tmux/vlc.js)"
tm_battery="#[fg=$base0F, bg=$base00] ♥ #(osascript ~/.dotfiles/tmux/battery.applescript)%%"
tm_disk="#[fg=$base0B, bg=$base00] #(osascript ~/.dotfiles/tmux/disk-usage.applescript)"
tm_exdisk="#[fg=$base08, bg=$base00] #(osascript ~/.dotfiles/tmux/seagate-usage.applescript)"
#tm_weeknum="#[fg=$base08, bg=$base00] Week #(osascript ~/.dotfiles/tmux/weeknum.applescript)"
tm_weeknum="#[fg=$base0D, bg=$base00]Week #(date +'%V')"
tm_date="#[default,bg=$base00,fg=$base0C]%a %d %b %Y %R"
#tm_date="#[default,bg=$base00,fg=$base0C] #(date +%A\ %d\ %b\ %Y)"
tm_host="#[fg=$base0E,bg=$base00]⚢ $USER""s-macbook"
set -g status-right "$tm_tunes $tm_battery $tm_disk$tm_exdisk $tm_date $tm_host"
