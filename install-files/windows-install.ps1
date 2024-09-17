Type Set-ExecutionPolicy Unrestricted -Scope CurrentUser



# Powersherll Services
Update-Help

# Installing Scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Scoop
scoop bucket add extras
scoop install ttdl

# Installing Chocoly?
# Probably needs admin privilages
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Choco
choco install vim

# Editing Path (items that sometimes do not get added automatically)
# personal script folders
# edge, okular, vim
#
# Maybe add these only to $profile

# Winget
winget install --id Microsoft.PowerShell --source winget
# winget install vim   # Doesnt set Path?
winget install python
winget install Git.git
winget install MiKTeX
winget install "Strawberry Perl"
winget install qbittorrent --id qBittorrent.qBittorrentinget install Microsoft.PowerToys -s winget
