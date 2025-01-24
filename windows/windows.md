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


## Windows Security Systems
Sometimes the windows ransomware protection will falsely trigger, causing certain actions to be blocked. For example:
1. Apple Music will be refused access to the AMPLibraryAgent.exe file prevent the home page from loading
2. bakkesmod may be regected access from an update causeing the old version to still be ran

## Connecting Mac -> Windows
If logged in with a microsoft account, you must use the microsoft password as the login details
