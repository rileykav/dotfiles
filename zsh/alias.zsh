#######################################################
# Aliases
#######################################################
# Source definitions for place names
source $HOME/.dotfiles/zsh/definitions.zsh



# Find what type of ls in use
if ls --color > /dev/null 2>&1; then # GNU ls
    colourflag="--color"
else # macos ls
    colorflag="-G"
fi
# Macos Specific Aliases


# Use macvim if on MacOS
#if [[ "$(uname)" == "Darwin" ]]; then
    #alias vim='mvim -v'
#fi

# prompt
alias prompt-clear='PROMPT="%2~ " && RPROMPT=""'



### Terminal Usage
# Filesystem Navigation
alias /="cd /"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Terminal "Handeling"
alias ,x="exit"
alias zshempty="zsh -f"
alias chm7='chmod 700'

# File Listing
#alias l="ls -GpFp $colorflag"

alias ls="ls -G $colorflag"
alias la="ls -GAFp $colorflag"
alias ll="ls -GlFhp $colorflag"
alias lls="ls -GlFhp | rev|sort|rev"
alias lla="ls -GlahF $colorflag"
alias lld="ls -lF $colorflag | grep ^d"
alias l.="ls -GFd $colorflag .*"
alias lt="tree -C"
alias ltl="tree | less"
alias lt1="tree -L 1 -C"
alias lt2="tree -L 2 -C"
alias lt3l="tree -L 3 -C | less"
alias lt4l="tree -L 4 -C | less"
alias lt5l="less -L 5 -C | less"
alias treehere="tree . -oN file-tree.txt"
alias vtree="tree file-tree.txt"

alias grep="grep --color=auto"
alias df="df -h" # Disk free in bytes
alias du="du -hc -d 1 2>/dev/null" # Disk usage of folder
alias duriley="du -d 1 $HOME"
alias duhere="du -d 1"

alias o="open ."
alias cl='clear'

# Disable and enable .DS_STORE files
alias disabledsstore='defaults write com.apple.desktopservices DSDontWriteNetworkStores true'
alias enabledsstore='defaults write com.apple.desktopservices DSDontWriteNetworkStores false'

# pdfunite to merge pdf's
# Remove those pesky .DS_STORE files (Needs some work)
alias cleanup="find . -name '*.DS_STORE' -type f -ls -delete"




# tmux aliases
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tes='tmux new-session -A -s'


alias tk='tmux kill-session'
alias ,k='tmux kill-session'
alias tka='tmux kill-session -a'
alias tks='tmux kill-server'
alias thelp='echo "ta    = Attach to most recent\ntls   = List current tmux sessions\ntat   = Attach with -t\ntns   = start new session (give name)\ntka   = Kill all current tmux sessions\ntko   = Kill all other tmux sessions\nthelp = List current tmux aliases"'



# dotfile aliases
alias dotfiles="cd $HOME/.dotfiles"
alias zshrc="vim $HOME/.zshrc"
alias zshalias="vim $HOME/.dotfiles/zsh/alias.zsh"
alias zshfunctions="vim $HOME/.dotfiles/zsh/functions.zsh"
alias zshdefinitions="vim $HOME/.dotfiles/zsh/definitions.zsh"
alias vimrc="vim $HOME/.vimrc"
alias vimfiletypes="vim $HOME/.dotfiles/vim/filetypes.vim"
alias tmuxrc="vim $HOME/.tmux.conf"
alias tmuxbase16="vim $HOME/.dotfiles/tmux/base16.sh"
alias rcloneignore="vim $HOME/.dotfiles/rclone/filter-list.txt"
alias rc-help='echo "zshrc\nvimrc\ntmuxrc\ntmuxbase16"'


# Sourcing zshrc
alias sourcezshrc="source $HOME/.zshrc"

# txt files
alias current="vim $HOME/current.txt"
alias journal="vim $HOME/journal.txt"
alias dutch="vim $HOME/dutch.txt"

alias pydir="cd $HOME/Coding/Python"
alias cdir="cd $HOME/Coding/C"
alias zshdir="cd $HOME/Coding/Zsh"
alias osascriptdir="cd $HOME/Coding/Applescript"




#--------------- Vim Aliases  ---------------#
alias vimclean="vim -u NONE"

# chmod aliases


# timer
alias alarm='~/Programming/zsh_scripts/alarm.sh'







### Specific Use Case
# Dublicating the cover in a cbz file
alias author-cbz="for i in **; do cd $i;zip *.cbz cover.jpg; cd ..; done"



# Backup dotfiles (defunct now that .dotfiles git is working)
alias dot-backup="/bin/zsh $HOME/riley-dotfiles/install/new_backup.sh"



# Open vim cheatsheet
alias vim-cheat="open ~/Programming/Vim/vi-vim-tutorial.pdf"



### Git
#git init #to initialise the repo
alias ga='git add'
alias gc='git commit'
alias gph='git push'
alias gpl='git push'
alias gst='git status'
alias ghp='echo "ga = git add\ngc = git commit\ngph= git push\ngpl= git push\ngst= git status"    
'
alias glg='git lg'


# Github (gh)
alias gi='gh issue'

alias gil='gh issue list $1 --search "is:issue is:open sort:created-asc"'
alias gli='gh issue list $1 --search "is:issue is:open sort:created-asc"'
alias gie='gh issue edit'
alias gp='gh project --owner rileykav'

function reminders(){
    /usr/local/bin/reminders "$@" 2>/dev/null 
}



### Python
#Specifing a Python Version
alias py='python3.10'
alias python='python3.10'
alias pip='pip3.10'
# Virtual Enviornments
alias act="source env/bin/activate"
alias deact="deactivate"

### Octave
# alias octave='octave-cli'  # Breaks plotting

### Finder And GUI
# Hiding and showing Desktop
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"


### Safari pdf Rules (Doesn't work)
# alias safaripdfdowndef="defaults write com.apple.Safari WebKitOmitPDFSupport -bool YES"
# alias safaripdfopendef="defaults write com.apple.Safari WebKitOmitPDFSupport -bool NO"
# 
# alias safariopenpdfondownon="defaults write com.apple.Safari AutoOpenSafeDownloads -bool YES"
# alias safariopenpdfondownoff="defaults write com.apple.Safari AutoOpenSafeDownloads -bool NO"


# Hiding and showing Hidden Files
alias hidehiddenfiles='defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder'
alias showhiddenfiles='defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder'
#https://www.chriswrites.com/how-to-place-any-dashboard-widget-on-your-macs-desktop/
#alias hidewidgets="defaults write com.apple.dashboard && devmode YES"


#Unmount Drives
alias unmountseagate='diskutil unmount /Volumes/Seagate\ 4TB'
alias ejectseagate='diskutil eject /Volumes/Seagate\ 4TB'
#alias unmountall  #Not sure how to work this, see https://stackoverflow.com/questions/2049758/is-there-a-way-to-eject-all-external-hard-drives-from-the-command-line-os-x


# Opening applications
alias spotify='open /Applications/Spotify.app'
alias calibre='open /Applications/Calibre.app'
alias calendar='open /Applications/Calendar.app'
alias calculator='open /Applications/Calculator.app'
alias discord='open /Applications/Discord.app'
alias firefox='open /Applications/Firefox.app'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias texmaker='open /Applications/texmaker.app'
alias whatsapp='open /Applications/WhatsApp.app'
alias vsc='/Applications/Visual\ Studio\ Code.app'
alias gimp='/Applications/GIMP-2.10.app'

alias timetable="open $HOME/Utrecht/Timetable/*.png"
alias uutimetable="open $HOME/Utrecht/Timetable/*.png"
#
# Macbook specific i.e. requires applescript (move?) 
alias for-beltalowda="vlc $HOME/Torrents/YouTube\ Playlists/For\ Beltalowda/000\ -\ VideoPlaylist "
alias lofi="vlc $HOME/Torrents/YouTube\ Playlists/lofi/000\ -\ VideoPlaylist"
alias critical-role-lofi="vlc $HOME/Torrents/YouTube\ Playlists/Critical\ Role\ Lofi/000\ -\ VideoPlaylist "
alias music-compilation="vlc $HOME/Torrents/YouTube\ Playlists/Music\ Compilation/000\ -\ VideoPlaylist "
alias music="vlc $HOME/Torrents/YouTube\ Playlists/Music/000\ -\ VideoPlaylist"
alias asmr="vlc $HOME/Torrents/YouTube\ Playlists/ASMR\ Studying\ Together/000\ -\ VideoPlaylist"
alias orchestra="vlc $HOME/Torrents/YouTube\ Playlists/Orchestra/000\ -\ VideoPlaylist"
alias expanse="/Users/riley/Torrents/YouTube\ Playlists/For\ Beltalowda/000\ -\ VideoPlaylist"
alias vlc-playing="osascript -l JavaScript $HOME/.dotfiles/tmux/vlc.js"
alias mult-vlc-playing="osascript -l JavaScript $HOME/.dotfiles/tmux/mult-vlc.js"







alias grmerge="/bin/zsh $HOME/Utrecht/NS-TP428M\ -\ General\ Relativity/Problem\ Sheets/.joingr.sh"
alias sftmerge="/bin/zsh $HOME/Utrecht/NS-TP402M\ -\ Statistical\ Field\ Theory/Problem\ Solving/.joinsft.sh"
alias qftmerge="/bin/zsh $HOME/Utrecht/NS-TP401M\ -\ Quantum\ Field\ Theory/Problem\ Sheets/.joinqft.sh"
alias stmerge="/bin/zsh $HOME/Utrecht/NS-TP526M\ -\ String\ Theory/Problem\ Sheets/.joinst.sh"
alias cmmerge="/bin/zsh $HOME/Utrecht/NS-TP430M\ -\ Cosmology/Problem\ Sheets/.joincm.sh"


# Quickly navigate to class folder
alias mt="cd $HOME/Utrecht/NS-TP551\ -\ Masters\ Thesis"
alias stsem="cd $HOME/Utrecht/NS-TP504M\ -\ Student\ Seminar"
alias datata="cd $HOME/Utrecht/Teaching\ Assistant/NS-109B\ -\ Data/Problem\ Sheets/My-Solutions"
alias icsnotes="vim $HOME'/Utrecht/WI-SB356 - Introduction to Scientific Computing/Notes/ics-notes.tex'"
alias ics="cd $HOME'/Utrecht/WI-SB356 - Introduction to Scientific Computing/Coding/Octave'"

alias ld="cd $HOME/Bookshelf/Italiano/langdeck"

alias modgif="convert -delay 10 -l
oop 0 plots/*.png spin.gif"






alias grindupload="rclone -P sync $HOME/Bookshelf/Grinds/ mydrive:Grinds"

alias storage="osascript $HOME/.dotfiles/tmux/disk-usage.scpt"

# Italiano
alias ittest="(cd $HOME/Bookshelf/Italiano && py test-words.py)"



















# Anaconda 
alias base_ana=". /Users/riley/opt/anaconda3/bin/activate && conda activate /Users/riley/opt/anaconda3;"
alias anaconda3=". /Users/riley/opt/anaconda3/bin/activate && conda activate /opt/anaconda3;"
alias anapy="/Users/riley/opt/anaconda3/bin/python" 









# Images in Terminal
alias img="imgcat"





# Vim Stuff
alias vimswps="lla $HOME/.dotfiles/vim/swapfiles"
alias vimrmswps="rm $HOME/.dotfiles/vim/swapfiles/*"




# Testing Directory
alias testing="cd $HOME/Coding/Testing"



# Wacom Quick Change
alias wacom-vert="open /Users/riley/.dotfiles/wacom/Preferences-portrait.wacomprefs/"
alias wacom-horiz="open /Users/riley/.dotfiles/wacom/Preferences-landscape.wacomprefs/"


# Clamshell Mode
# Install via https://github.com/pirj/noclamshell
alias clamshelloff="brew services start noclamshell &>/dev/null"
alias clamshellon="brew services stop noclamshell &>/dev/null"







# Cursor
alias showcursor="tput cnorm"
alias hidecursor="tput civis"
