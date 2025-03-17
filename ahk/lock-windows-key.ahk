#Requires AutoHotkey v2.0
#NoTrayIcon
#SingleInstance Force

; This script is designed to stop the windows key interfering with games (e.g. Dota 2)
; Default it turns LWin into LAlt, as this is typically more desirable (LWin is clicked by accident when tryin to click LAlt)

toggle := false

NumLock:: {
    ; NumLock is rebound to FnWin / Fn + LAlt for my keyboard without a Numpad
    global toggle
    if toggle 
        toggle:= false  ; Flip the toggle when NumLock is pressed
    else
        toggle := true
}
~RWin:: {
    global toggle
    toggle:=false
}
#Hotif toggle
LWin::LAlt
; LWin::return

