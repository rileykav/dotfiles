#Requires AutoHotkey v2.0
#NoTrayIcon
#SingleInstance Force

; Rebinds common windows control hotkeys, so that windows will also work as the trigger.
; # is windows
; ^ is control
; is alt
#w::^w
#c::^c
#v::^v
#q::WinClose('A')
#w::^w
#z::^z
#a::^a
#d::^d
#s::^s
#t::^t
#+t::^+t

#e::^e
#r::^r
#y::^y
#u::^u
#i::^i
#o::^o
#p::^p
#f::^f
#g::^g
#h::^h
#j::^j
#k::^k
#l::^l
#x::^x
#b::^b
#n::^n
#m::^m









*~LWin::
{
    ; Function to bind LWin in a Macos-like way. 
    ; Two properties, when triggered with tab acts as alt-tab
    ; when triggered alone LWin
    ; when triggered with other binds remains as LWin. 
    ; While one could change this behaviour to be LCtrl when with other binds, I prefer to retain certain 
    ; LWin keybinds (like LWin-Shift-S for screenshots)
    ; Above we rebind many simple LWin-Character binds to their control counterpart.
    global
    LWinDownTime := A_TickCount
    while (GetKeyState("LWin", "P"))  ; Check if LWin is still pressed
    {
        if (A_PRIORKEY = "Tab" && (A_TickCount - LWinDownTime) < 300)
        {
            Send("{Blind}{LAlt down}")  ; Press LAlt if Tab wasn't pressed
            KeyWait("LWin")  ; Wait until LWin is released
            Send("{Blind}{LAlt up}")  ; Release LAlt if Tab wasn't pressed
        }
        if (A_PRIORKEY != "Tab" && A_PRIORKEY != "LWin")
        {
        ToolTip("Lwin triggered")
            ; Place changes to key combinations here, will have to change how the return works as this triggers ~LWin
            return
        }
        
        if (A_TickCount - LWinDownTime) > 750
        {
            ; Timeout to avoid getting accidentily locked into this while loop
            return  
        }
    }
    if (A_TickCount - LWinDownTime) < 250
    {
        ; Treat LWin normally for quick press. 
        return  
    }
    return

    ; Bugs:
    ; - Default Lwin-Tab behavior triggers when pressed simultanously maybe or maybe too quickly?
}



