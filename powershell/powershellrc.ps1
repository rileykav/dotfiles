#https://stackoverflow.com/questions/12143245/powershell-configuration-with-an-rc-like-file


Import-Module $HOME\.dotfiles\powershell\alias.ps1
Import-Module $HOME\.dotfiles\powershell\prompt.ps1

# Colour
$PSStyle.FileInfo.Directory = "`e[36m"


# Tab complete shows all options
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete


# Makes a symlink. Usage is 
# make-link link-file.lnk real-file.ex
function make-link ($link, $target) {
	New-Item -Path $link -ItemType SymbolicLink -Value $target
}

