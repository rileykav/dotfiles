& $home\Documents\Applications\Windhawk\windhawk.exe -tray-only




# Define the folder where your .ahk scripts are located
$ahkFolder = "C:\Users\lykav\.dotfiles\ahk"

# Define the path to AutoHotkey executable (use the full path if it's not in your system's PATH)
$ahkExe = "C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe"

# Get all .ahk files in the folder
$ahkFiles = Get-ChildItem -Path $ahkFolder -Filter "*.ahk"

# Loop through each .ahk file and run it
foreach ($file in $ahkFiles) {
    # Run each script in a new PowerShell process (similar to running in a new window)
    Start-Process -FilePath $ahkExe -ArgumentList $file.FullName
}
