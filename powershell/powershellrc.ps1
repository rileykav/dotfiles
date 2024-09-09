#https://stackoverflow.com/questions/12143245/powershell-configuration-with-an-rc-like-file


$PSStyle.FileInfo.Directory = "`e[36m"


# Prompt
# function Prompt {
function DatePrompt {
  # Print the current time:
  Write-Host ("[") -nonewline 
  Write-Host (Get-Date -format HH:mm:ss) -nonewline 
  Write-Host ("] ") -nonewline 
  # Print the working directory:
  Write-Host ($PWD) -nonewline 
  # Print the promot symbol:
  return "> ";

}


# https://commandline.ninja/customize-pscmdprompt/
function FancyPrompt {
# function Prompt {

    #Assign Windows Title Text
    $host.ui.RawUI.WindowTitle = "Current Folder: $pwd"

    #Configure current user, current folder and date outputs
    $CmdPromptCurrentFolder = Split-Path -Path $pwd -Leaf
    $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent();
    $Date = Get-Date -Format 'dddd hh:mm:ss tt'

    # Test for Admin / Elevated
    $IsAdmin = (New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

    #Calculate execution time of last cmd and convert to milliseconds, seconds or minutes
    $LastCommand = Get-History -Count 1
    if ($lastCommand) { $RunTime = ($lastCommand.EndExecutionTime - $lastCommand.StartExecutionTime).TotalSeconds }

    if ($RunTime -ge 60) {
        $ts = [timespan]::fromseconds($RunTime)
        $min, $sec = ($ts.ToString("mm\:ss")).Split(":")
        $ElapsedTime = -join ($min, " min ", $sec, " sec")
    }
    else {
        $ElapsedTime = [math]::Round(($RunTime), 2)
        $ElapsedTime = -join (($ElapsedTime.ToString()), " sec")
    }

    #Decorate the CMD Prompt
    Write-Host ""
    Write-host ($(if ($IsAdmin) { 'Elevated ' } else { '' })) -BackgroundColor DarkRed -ForegroundColor White -NoNewline
    Write-Host " USER:$($CmdPromptUser.Name.split("\")[1]) " -BackgroundColor DarkBlue -ForegroundColor White -NoNewline
    If ($CmdPromptCurrentFolder -like "*:*")
        {Write-Host " $CmdPromptCurrentFolder "  -ForegroundColor White -BackgroundColor DarkGray -NoNewline}
        else {Write-Host ".\$CmdPromptCurrentFolder\ "  -ForegroundColor White -BackgroundColor DarkGray -NoNewline}

    Write-Host " $date " -ForegroundColor White
    Write-Host "[$elapsedTime] " -NoNewline -ForegroundColor Green
    return "> "
} #end prompt function


# See https://stackoverflow.com/questions/1287718/how-can-i-display-my-current-git-branch-name-in-my-powershell-prompt
function Write-BranchName () {
    try {
        $branch = git rev-parse --abbrev-ref HEAD

        if ($branch -eq "HEAD") {
            # we're probably in detached HEAD state, so print the SHA
            $branch = git rev-parse --short HEAD
            Write-Host " ($branch)" -ForegroundColor "red" -NoNewline
        }
        else {
            # we're on an actual branch, so print it
            $Status=$null;
            $Status=$(git status -porcelain)
            if ($Status -ne $null){
                Write-Host " ($branch)" -ForegroundColor "green" -NoNewline
            }
            else{
                    
                Write-Host " ($branch)" -ForegroundColor "yellow" -NoNewline
            }
        }
    } catch {
        # we'll end up here if we're in a newly initiated git repo
        Write-Host " (no branches yet)" -ForegroundColor "yellow" -NoNewline
    }
}


#"$($PSStyle.Foreground.FromRgb(0xa020f0))$base$($PSStyle.Reset)"
function PowershellVersion { 

    $psvmajor="$($host.version.major)"
    $psvminor="$($host.version.minor)"
    $psvbuild="$($host.version.build)"
    $base = "Powershell $psvmajor.$psvminor.$psvbuild"  
#     Write-Host "$($PSStyle.Foreground.FromRgb(0xa020f0))$base$($PSStyle.Reset)"
    return $base
}
function FirstSessionPrint {
    $psversion=PowershellVersion
    $Date = Get-Date -Format 'dddd HH:mm:ss'
#     Write-Host $psversion $Date -ForegroundColor "darkgray"
    Write-Host $psversion $Date 
}   
cls
FirstSessionPrint

function prompt {
    $path = "$($executionContext.SessionState.Path.CurrentLocation)"
    $userPrompt = " $('>' * ($nestedPromptLevel + 1)) "

#     Write-Host "`n$base " -NoNewline
    if (Test-Path .git) {
        Write-Host "$($PSStyle.Foreground.FromRgb(0xacda8a))$path$($PSStyle.Reset)" -NoNewline
        Write-BranchName 
    }
    else {
        # we're not in a repo so don't bother displaying branch name/sha
        Write-Host "$($PSStyle.Foreground.FromRgb(0xacda8a))$path$($PSStyle.Reset)" -NoNewline
    }

    return $userPrompt
}














# Tab complete shows all options
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete


function refresh{. $profile} # Doesn't Work
function Invoke-PowerShell {
    powershell -nologo
    Invoke-PowerShell
}

function vimrc {vim $HOME\_vimrc } 
function powershellprofile {
    vim $PROFILE
}
set-alias -name psrc -value powershellprofile



#$HOME\.dotfiles\vim:VIM

function make-link ($link, $target) {
	New-Item -Path $link -ItemType SymbolicLink -Value $target
}
































