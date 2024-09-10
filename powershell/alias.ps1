# Alias Functions

# Git Alias
function gst {git status}

$dotfiles="$home\.dotfiles"

# Config Files
function psrc {vim $profile}
function psalias {vim $home\.dotfiles\powershell\alias.ps1}
function vimrc {vim $home\_vimrc}
function vimalias {vim $dotfiles\vim\alias.vim}
function vimwindows {vim $dotfiles\vim\windows.vim}
function vimswapfiles {cd $dotfiles\vim\swapfiles}


function terminalrc {vim $dotfiles\windows-terminal\windows-terminal-settings.json}
function test {echo test1}



# Applications
function o {ii .}
function winscp {C:\Users\lykav\Documents\Applications\WinSCP.lnk}
function vlc {& 'C:\Users\lykav\Documents\Applications\VLC media player.lnk'}

# cd
function .. {cd ..}
function ... {cd ..\..}
function .... {cd ..\..\..}


# Python Alias
function py {python}
