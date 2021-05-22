#######################################################
# Aliases
#######################################################
# Find what type of ls in use
if ls --color > /dev/null 2>&1; then # GNU ls
    colourflag="--color"
else # macos ls
    colorflag="-G"
fi

# Filesystem Navigation
alias /="cd /"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# File Listing
alias l="ls -GpF $colorflag"
alias la="ls -AF $colorflag"
alias ll="ls -lFh $colorflag"
alias lla="ls -lahF $colorflag"
alias lld="ls -lF $colorflag | grep ^d"
alias lt="tree | less"
alias lt1="tree -L 1"
alias lt2="tree -L 2 | less"
alias lt3="tree -L 3 | less"
alias lt4="tree -L 4 | less"
alias lt5="less -L 5 | less"

alias grep="grep --color=auto"
alias df="df -h" # Disk free in bytes
alias du="du -h -c" # Disk usage of folder


# pdfunite to merge pdf's

# Hiding and showing Desktop
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"


# Hiding and showing Hidden Files
alias hidehiddenfiles='defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder'
alias showhiddenfiles='defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder'

# Disable and enable .DS_STORE files
alias disabledsstore='defaults write com.apple.desktopservices DSDontWriteNetworkStores true'
alias enabledsstore='defaults write com.apple.desktopservices DSDontWriteNetworkStores false'

# Remove those pesky .DS_STORE files (Needs some work)
alias cleanup="find . -name '*.DS_STORE' -type f -ls -delete"


# Use macvim if on MacOS
if [[ "$(uname)" == "Darwin" ]]; then
    alias vim='mvim -v'
fi

# Application aliases
alias firefox='/Applications/Firefox.app'



# tmux aliases
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -A -s'
alias tka='tmux kill-server'
alias tko='tmux kill-session -a'
alias thelp='echo "ta    = Attach to most recent\ntls   = List current tmux sessions\ntat   = Attach with -t\ntns   = start new session (give name)\ntka   = Kill all current tmux sessions\ntko   = Kill all other tmux sessions\nthelp = List current tmux aliases"'
#alias tns2='
#    if [ $1 ]; then
#        echo "$1 Exists, attaching"
#        sleep 1
#        ta $1
#    else
#        echo "$1 Does not exist, creating"
#        sleep 1
#        tmux new-session -s $1
#    fi
#
#'
#function tns(){
#    if [ tmux has-session -t $1 2>/dev/null == 2 ]; then
#        tmux new-session -s $1
#    else
#        echo "$2 Exists, attaching"
#        sleep 1
#        tat $1
#    fi
#}


# dotfile aliases
alias zshrc="vim $HOME/.zshrc"
alias zshalias="vim $HOME/.dotfiles/zsh/alias.zsh"
alias vimrc="vim $HOME/.vimrc"
alias tmuxrc="vim $HOME/.tmux.conf"
alias tmuxbase16="vim $HOME/.dotfiles/tmux/base16.sh"
alias rc-help='echo "zshrc
vimrc
tmuxrc
tmuxbase16"'

# python aliases
alias py='python3.9'

# chmod aliases
alias chm7='chmod 700'


# opening applications
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


# timer
alias alarm='~/Programming/zsh_scripts/alarm.sh'



# Dublicating the cover in a cbz file
alias author-cbz="for i in **; do cd $i;zip *.cbz cover.jpg; cd ..; done"



# Backup dotfiles
alias dot-backup="/bin/zsh /Users/riley/riley-dotfiles/install/new_backup.sh"



# Open vim cheatsheet
alias vim-cheat="open ~/Programming/Vim/vi-vim-tutorial.pdf"



# git aliases
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gs='git status'






# ----------------------
# Git Aliase https://www.reddit.com/r/commandline/comments/nf898c/why_does_iterm_show_a_when_i_restore_the_session/
# ----------------------
alias ga='git add .'
alias gm='git commit -m'
# This is a function to automate the creation of new a project folder,
# git init, create github repo and push
function gnew () {
if [ $# -eq 1 ]
then
mkdir $1
cd $1
git init
touch README.md
git add .
git commit -m 'first commit'
git branch -M main
gh repo create $1 --confirm --public
git push --set-upstream origin main
else
echo "Please specify project name - 1 argument only"
fi
}


