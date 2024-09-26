# Alias Functions

# Git Alias
function gst {git status}

$dotfiles="$home\.dotfiles"

# Config Files
function psrc {vim $profile}
function psalias {vim $home\.dotfiles\powershell\alias.ps1}
function vimrc {vim $home\_vimrc}
function vimalias {vim $dotfiles\vim\alias.vim}
function vimfunctions {vim $dotfiles\vim\functions.vim}
function vimvisuals {vim $dotfiles\vim\visuals.vim}
function vimfiletypes {vim $dotfiles\vim\filetypes.vim}
function vimwindows {vim $dotfiles\vim\windows.vim}
function vimswapfiles {cd $dotfiles\vim\swapfiles}
function vimbasic ($file) {vim -u $dotfiles\vim\basic.vim $file}
function vimbasicedit {vim $dotfiles\vim\basic.vim}

function windowsinstall {vim $dotfiles\install-files\windows-install.ps1}

function terminalrc {vim $dotfiles\windows-terminal\windows-terminal-settings.json}
function test {echo test1}


Set-Alias -name todo -value ttdl

# Applications
function o {ii .}
function winscp {C:\Users\lykav\Documents\Applications\WinSCP.lnk}
function vlc {& 'C:\Users\lykav\Documents\Applications\VLC media player.lnk'}
function edge {& "C:\Users\lykav\Documents\Applications\edge.lnk"}
# function okular {'.\$HOME\AppData\Local\Okular\bin\okular.exe'}

# cd
function .. {cd ..}
function ... {cd ..\..}
function .... {cd ..\..\..}


# Python Alias
function py {python}


# Termianl Alias
function :x {exit} # I'd like to use ,x (same as vim) but powershell gets mad :(



function pshistory {cat (Get-PSReadlineOption).HistorySavePath | Select-String -Pattern "winget install" -SimpleMatch | Set-Content winget-installes.txt}
