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
alias :x="exit"
alias zshempty="zsh -f"
alias chm7='chmod 700'

# File Listing
#alias l="ls -GpFp $colorflag"

alias ls="ls -G1 $colorflag"
alias la="ls -G1AFp $colorflag"
function ll() {
    # First awk skips the total line, then goes line by line and prints the desired lines
    ls -l --color=always -- "$@" | awk '
        /^total/ { next }
        {
            printf "%2s %3s %5s ", $6, $7, $8
            for (i = 9; i <= NF; i++) {
                printf "%s%s", $i, (i == NF ? "\n" : " ")
            }
        }
    '
}
function lla() {
    # First awk skips the total line, then goes line by line and prints the desired lines
    ls -al --color=always -- "$@" | awk '
        /^total/ { next }
        {
            printf "%2s %3s %5s ", $6, $7, $8
            for (i = 9; i <= NF; i++) {
                printf "%s%s", $i, (i == NF ? "\n" : " ")
            }
        }
    '
}




function ll2() {
    output=""
    ls -l --color=always -- "$@" | while IFS= read -r line; do
        [[ "$line" == total* ]] && continue

#         permisions=$(echo "$line" | awk '{print $1}')
#         hardlinkcount=$(echo "$line" | awk '{print $2}')
#         owner=$(echo "$line" | awk '{print $3}')
#         group=$(echo "$line" | awk '{print $4}')
#         filesizebytes=$(echo "$line" | awk '{print $5}')
        day=$(echo "$line" | awk '{print $6}')
        month=$(echo "$line" | awk '{print $7}')
        time_or_year=$(echo "$line" | awk '{print $8}') # If year matches current prints time, otherwise year
        filename=$(echo "$line" | awk '{for (i=9; i<=NF; i++) printf "%s%s", $i, (i==NF ? "\n" : " ")}')

        #     printf "%2s %3s %5s %s\n" "$day" "$month" "$time_or_year" "$filename"
        line=$(printf "%2s %3s %5s %s" "$day" "$month" "$time_or_year" "$filename")"\n"
        output=$output$line
    done
    printf "$output"
}
# alias ll="ls -G1lFhp $colorflag"
alias lls="ls -G1lFhp | rev|sort|rev"
# alias lla="ls -G1lahF $colorflag"
alias lld="ls -1lF $colorflag | grep ^d"
alias l.="ls -G1Fd $colorflag .*"
alias lt="tree -C"
alias ltl="tree | less"
alias lt1="tree -L 1 -C"
alias lt2="tree -L 2 -C"
alias lt3l="tree -L 3 -C | less"
alias lt4l="tree -L 4 -C | less"
alias lt5l="less -L 5 -C | less"
alias treehere="tree . -oN file-tree.txt"
alias vtree="tree file-tree.txt"



# Finder Move and Copy (broken!)
function cpfinder() {osascript -e 'tell application "Finder" to duplicate POSIX file \"$1\" to POSIX file \"$2\"'}
function mvfinder() {osascript -e 'tell application "Finder" to move POSIX file \"$1\" to POSIX file \"$2\"'}




alias grep="grep --color=auto"
alias df="df -h" # Disk free in bytes
alias du="du -hc -d 1 2>/dev/null" # Disk usage of folder
alias dugig="du -hc -d 1 -t 1G 2>/dev/null" # Disk usage of folder
alias duriley="du -d 1 $HOME"
alias duhere="du -d 1"

alias o="open ."
alias cl='clear'
alias cls='clear'

# Disable and enable .DS_STORE files
alias disabledsstore='defaults write com.apple.desktopservices DSDontWriteNetworkStores true'
alias enabledsstore='defaults write com.apple.desktopservices DSDontWriteNetworkStores false'

# pdfunite to merge pdf's
# Remove those pesky .DS_STORE files (Needs some work)
alias cleanup="find . -name '*.DS_STORE' -type f -ls -delete"




# tmux aliases
alias tmux="env TERM=screen-256color tmux"
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tes='tmux new-session -A -s'


alias tk='tmux kill-session'
alias ,k='tmux kill-session'
alias tka='tmux kill-session -a'
alias tks='tmux kill-server'
alias thelp='echo "ta    = Attach to most recent\ntls   = List current tmux sessions\ntat   = Attach with -t\ntns   = start new session (give name)\ntka   = Kill all current tmux sessions\ntko   = Kill all other tmux sessions\nthelp = List current tmux aliases"'

function tunes-length(){
    sed -E -i '' 's/output = output\.substr\(0,[0-9]+\)/output = output.substr(0,'$1')/' ~/.dotfiles/tmux/tunes.js
}



# dotfile aliases
alias dotfiles="cd $HOME/.dotfiles"
alias zshrc="vim $HOME/.zshrc"
alias zshalias="vim $HOME/.dotfiles/zsh/alias.zsh"
alias zshfunctions="vim $HOME/.dotfiles/zsh/functions.zsh"
alias zshdefinitions="vim $HOME/.dotfiles/zsh/definitions.zsh"
alias zshignoreautocomplet="vim $HOME/.dotfiles/zsh/ignore-autocomplete.zsh"
alias vimrc="vim $HOME/.vimrc"
alias vimfiletypes="vim $HOME/.dotfiles/vim/filetypes.vim"
alias vimmac="vim $HOME/.dotfiles/vim/mac.vim"
alias tmuxrc="vim $HOME/.tmux.conf"
alias tmuxbase16="vim $HOME/.dotfiles/tmux/base16.sh"
alias rcloneignore="vim $HOME/.dotfiles/rclone/filter-list.txt"
alias rc-help='echo "zshrc\nvimrc\ntmuxrc\ntmuxbase16"'
alias gitconfig="vim $HOME/.gitconfig"
alias gitignore="vim $HOME/.dotfiles/git/gitignore_global.git"
alias vimbasicedit="vim $HOME/.dotfiles/vim/basic.vim"
function vimbasic {
    vim -u $HOME/.dotfiles/vim/basic.vim $1
}


function todo {
    if [[ $HOME/iCloud/Documents/todo.md -nt $HOME/todo.md ]]; then
        cp $HOME/iCloud/Documents/todo.md $HOME/todo.md
        vim $HOME/todo.md
    else
        vim $HOME/todo.md
    fi

}

# Markdownaliases
alias bookmarks="vim ~/.dotfiles/browsers/bookmarks.md"
alias markdownfiles="cd ~/iCloud/Documents"
alias civguide="vim ~/iCloud/Documents/Markdown\ Files/Games/CivVI.md"


# alias todo="vim $HOME/iCloud/Documents/todo.md"
alias todoi="vim $HOME/iCloud/Documents/todo.md"
alias todol="vim $HOME/todo.md"



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


function mcmods {
    readonly mcversion=${1:?"Minecraft version must be specified"}
    echo "Download mods..."
    mkdir -p "$HOME/Personal/Games/minecraft/mods $mcversion"
    curl -sL https://raw.githubusercontent.com/aayushdutt/modrinth-collection-downloader/master/main.py | python - -v $mcversion -l fabric -c 9zXT2dGO -d "$HOME/Personal/Games/minecraft/mods $mcversion" -u 
#     wget -qO- https://raw.githubusercontent.com/aayushdutt/modrinth-collection-downloader/master/main.py | python - -v $mcversion -l fabric -c 9zXT2dGO -d "$HOME/Personal/Games/minecraft/mods $mcversion" -u
    setopt localoptions rmstarsilent
    rm -f "$HOME/Library/Application Support/minecraft/mods/"*
    cp "$HOME/Personal/Games/minecraft/mods $mcversion/"* "$HOME/Library/Application Support/minecraft/mods"
}


#--------------- Vim Aliases  ---------------#
alias vimclean="vim -u NONE"

# chmod aliases


# timer
alias alarm='~/Programming/zsh_scripts/alarm.sh'







### Specific Use Case
# Dublicating the cover in a cbz file
alias author-cbz="for i in **; do cd $i;zip *.cbz cover.jpg; cd ..; done"






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
alias github='open "/Applications/GitHub Desktop.app"'

# Github (gh)
alias gi='gh issue'
alias giuntrack='gh issue edit --add-label untracked'
alias giretrack='gh issue edit --remove-label untracked'

# alias gil='gh issue list $1 --search "is:issue is:open sort:created-asc"'
# alias gli="gh ils --label=$1"
alias gie='gh issue edit'
alias gp='gh project --owner rileykav'

alias lg="lazygit"
alias lgdotfiles="(cd $HOME/.dotfiles && lazygit)"



function reminders(){
    /usr/local/bin/reminders "$@" 2>/dev/null 
}

# List issues, optional argument to add labels 
function gil(){
    # Alias for listing issues, the additional filtering requires it
    # be a function. To add additional filters they must be placed like this
    clear
    gll_temp=""
    for i in $@ ; do gll_temp="${gll_temp},$i" ; done
    gh issue list --label="${gll_temp:1}" --search '-label:untracked, sort:created-asc' --limit 1000
}
function test(){
#     printf '%s %s\n' "$@[out]"
#     for i in $@ ; do echo $i ; done
#     for ((i=1; i<=$#; i++)) ; do echo $*[i] ; done
    test_temp=""
    for i in $@ ; do test_temp="${test_temp},$i" ; done
    echo ${test_temp:1}
}

### Javascript
alias js="run-script $1"


### Python
#Specifing a Python Version
alias py='python'
alias pybrew='/usr/local/Cellar/python@3.13/3.13.0_1/bin/python3'
alias pyconda="/Users/riley/opt/anaconda3/bin/python" 
alias base_ana=". /Users/riley/opt/anaconda3/bin/activate && conda activate /Users/riley/opt/anaconda3;"
alias anaconda3=". /Users/riley/opt/anaconda3/bin/activate && conda activate /opt/anaconda3;"
# Virtual Enviornments
alias act="source env/bin/activate"
alias deact="deactivate"

### Octave
# alias octave='octave-cli'  # Breaks plotting

### Finder And GUI
# Hiding and showing Desktop
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"


### System Power
system-sleep() {osascript -e 'tell app "System Events" to sleep'}
system-shutdown() {osascript -e 'tell app "System Events" to shut down'}
system-restart() {osascript -e 'tell app "System Events" to restart'}



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

# Import/Export App Keyboard Shortcuts
alias exportkeyboardshortcuts="defaults export com.apple.symbolichotkeys - > $HOME/.dotfiles/mac/macos-keyboard-shortcuts.xml"
alias importkeyboardshortcuts="defaults import com.apple.symbolichotkeys $HOME/.dotfiles/mac/macos-keyboard-shortcuts.xml"
alias releadsystemsettings="System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u"



# Microsft AutoUpdater
# https://superuser.com/questions/1544338/turn-off-microsoft-apps-microsoft-autoupdate-app-on-a-mac
# alias disablemsautoupdate="launchctl disable gui/$(id -u)/com.microsoft.update.agent"
# alias enablemsautoupdate="launchctl enable gui/$(id -u)/com.microsoft.update.agent"
# alias checkmsautoupdate="launchctl print-disabled gui/$(id -u) | grep -o microsoft | sed 's/^[[:space:]]*//'"
alias disablemsautoupdate="sudo mv /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.backup.app "
alias enablemsautoupdate="sudo mv /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.backup.app /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app "
alias checkmsautoupdate="echo $(ls /Library/Application\ Support/Microsoft/MAU2.0)"


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




# CPDF (Command Line PDF Tools)
alias cpdf="$HOME/Bookshelf/Coding/cpdf-binaries-master/OSX-ARM/cpdf"
# Examples:
# cpdf -add-page-labels in.pdf 1-4 -label-style LowercaseRoman -o out.pdf
# cpdf -add-page-labels out.pdf 5-14 -o out2.pdf


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


# Italiano
alias ittest="(cd $HOME/Bookshelf/Italiano && py test-words.py)"




























# Images in Terminal
alias img="imgcat"


# Speedtest
alias speedtest="speedtest 2>/dev/null"


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



# Calander
alias plusschedule="(cd $HOME/Coding/Python/Calander && python cal.py)"
alias newplusschedule="mv $HOME/Documents/Plus.ics $HOME/Coding/Python/Calander"
function test(){
    mv /Users/riley/Documents/Test1.ics /Users/riley/Coding/Python/Calander/
    mv /Users/riley/Documents/Test2.ics /Users/riley/Coding/Python/Calander/
}

# Cursor
alias showcursor="tput cnorm"
alias hidecursor="tput civis"


# NetBios Name
alias netbios-name="plutil -p /Library/Preferences/SystemConfiguration/com.apple.smb.server.plist"

# https://github.com/sandreas/m4b-tool
alias m4b-tool='docker run -it --rm -u $(id -u):$(id -g) -v "$(pwd)":/mnt sandreas/m4b-tool:latest'
#
# Usuage: 
# m4b-tool merge "data/my-audio-book/" --output-file="data/merged.m4b"


alias flattenpaper="(cd /Users/riley/Utrecht/NS-TP551\ -\ Masters\ Thesis/Project\ Code/Paper\ Draft/ && latexpand --keep-comments /Users/riley/Utrecht/NS-TP551\ -\ Masters\ Thesis/Project\ Code/Paper\ Draft/paper.tex > paper-full.tex)"


### Suspended Jobs in Zsh (What are they though?)
# https://stephencharlesweiss.com/zsh-suspended-jobs
# https://unix.stackexchange.com/questions/45025/how-to-suspend-and-bring-a-background-process-to-foreground
alias suspendedjobsStart='fg'
alias suspendedjobsList='jobs'
alias suspendedjobsKill='jobs -s | kill %1'





