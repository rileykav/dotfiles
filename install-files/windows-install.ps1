### Basic Install Instructions
# Allow all applications to make a desktop shortcut, then mve it from there to a Applications folder for ease of later access



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
winget search icloud --id Apple.iCloud --source winget
winget install whatsapp --source msstore
winget install windhawk
winget install Plex --source winget
winget install Plexamp --source winget
winget install "Plex Media Server" --source winget
winget install "Blue Mail" --id 9PMHZVM588P4
winget install firefox --id Mozilla.Firefox --source winget
winget install "Docker Desktop" --id Docker.DockerDesktop --source winget
winget install wget --id JernejSimoncic.Wget

# Manual Install
curl -O "https://download01.logi.com/web/ftp/pub/techsupport/gaming/lghub_installer.exe" --output-dir $home/Download
url -O "https://rawaccel.net/wp-content/uploads/2023/12/RawAccel_v1.6.1.zip"  --output-dir $home/Downloads
curl -O "https://origin-a.akamaihd.net/EA-Desktop-Client-Download/installer-releases/EAappInstaller.exe" --output-dir $home/Download



# Manual Github Links
# https://github.com/White-Tiger/T-Cloc
# https://github.com/clsid2/mpc-hc


# True Manual
# https://getfancontrol.com/
# https://www.youtube.com/watch?v=XqY-BL5pLjQ&t=358s
# https://www.hwinfo.com/download/
# https://zen-browser.app/download
# Apples Devices App
