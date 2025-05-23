# Windows 

## Initial Set-up
Here we note some of the initial steps for Windows.


## Security Permissions
A common occurrence on windows is to encounter folders that you do not have access to (particularly on a drive that used to boot into windows). The most surefire way I have to fix this is to go to Properties > Security, remove all but you in the groups section, then under Advanced change the owner to you and enable 'Inheritance' and 'Replace all child object permission...'.

This tends to take a while, and sometimes it can be better to do it piecemeal per folder, and deleting those that are unimportant. Additionally running cmd as administrator, you can use:
rmdir /s /q C:\Documents\Unwanted
to attempt to remove the files, though this broke for me with access denied markers.


## Regedit 
To open the registry for edit, do <Windows-r> and go to regedit.

### Changing Fonts
To add additional fonts to cmd, first install as normal and check its name; then go to:
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont
and add a new string value, with name '000' and the Value data as the name of the font.

### Reverse Scrolling Direaction
Manual Method:
1. Open Start.
2. Search for regedit and click the top result to open the Registry Editor.
3. Browse the following path:HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\HID
4. Expand the key (folder) that matches the "VID ID" of your mouse — for example, VID_0E0F&PID_0003&MI_01.
5. Expand the available key.
6. Select the Device Parameters key.
7. Double-click the FlipFlopWheel DWORD and set the value from 0 to 1.
Or the automated way:
`$mode = Read-host "How do you like your mouse scroll (0 or 1)?"; Get-PnpDevice -Class Mouse -PresentOnly -Status OK | ForEach-Object { "$($_.Name): $($_.DeviceID)"; Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Enum\$($_.DeviceID)\Device Parameters" -Name FlipFlopWheel -Value $mode; "+--- Value of FlipFlopWheel is set to " + (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Enum\$($_.DeviceID)\Device Parameters").FlipFlopWheel + "`n" }
## Installing Windows 11 on Unsupported Hardware
Windows 11 has a couple of requirements that provide an initial hard lock-out of installing / upgrading to Windows 11. The three primary checks the installer makes are:
- TPM 2.0 compatibility, this is based on your motherboard having the required TPM *chip*. Post 2016 Motherboards normally just have this turned off in BIOS. Set TPM To firmware.
- Approved CPU.
- Sufficient / appropriate ram, I think 4GB.

To bypass these, one must make the following registry edits:
- 

## Terminal
# "File cannot be loaded because running scripts is disabled on this system" Error
Run `Type Set-ExecutionPolicy Unrestricted -Scope CurrentUser`, (then click A?)
https://www.reddit.com/r/computer/comments/uxdek5/file_cannot_be_loaded_because_running_scripts_is/



### Making Symlinks with mklink 
#https://www.howtogeek.com/16226/complete-guide-to-symbolic-links-symlinks-on-windows-or-linux/
We only care about poiting at files for now, though /D and /J can be used for direactories.
Soft links arte closer to shortcuts in how they are seen by the system, while a hard link is normally interpretted as if the symlink was the actual file, this is the default behavior we want.
For a Hard Link: mklink /H Link Tarket 
For a Soft Link: mklink Link Tarket 

## Windows Security Systems
Sometimes the windows ransomware protection will falsely trigger, causing certain actions to be blocked. For example:
1. Apple Music will be refused access to the AMPLibraryAgent.exe file prevent the home page from loading
2. bakkesmod may be regected access from an update causeing the old version to still be ran

## Connecting Mac -> Windows
If logged in with a microsoft account, you must use the microsoft password as the login details



# Bugs
## Bluetooth Disconnection (Code 54)
Error probably in the driver, randomly disconnects (no known cause), with as reboot acting as a temporary fix (seems to disconnect again without a few hours or a few days)
- [Dell forum (fix accepted)](https://www.dell.com/community/en/conversations/networking-internet-bluetooth/bluetooth-error-code-54/647fa096f4ccf8a8de5a07fb)
- [Website walk-through of fix](https://thegeekpage.com/this-device-has-failed-error-code-54/)
- [Redit Forum (some fixes suggested, not accepted)](https://www.reddit.com/r/Windows11/comments/17997au/bluetooth_disappears_code_54/)
- [Reddit suggests  uninstall drivers and reinstall fresh copy from source](https://www.reddit.com/r/techsupport/comments/i04t42/laptop_bluetooth_this_device_has_failed_and_is/)
