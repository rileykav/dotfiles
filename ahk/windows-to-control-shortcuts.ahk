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
^q::WinClose('A')
#q::Send('^q')
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





*LWin::
{
    global
    LWinDownTime := A_TickCount
    Send("{Blind}{LAlt down}")  ; Treat LWin as LAlt when pressed

    ; Wait for LWin release and check if Tab was pressed in that time
    KeyWait("LWin")  ; Wait until LWin is released
    
    ; Check if Tab was pressed after LWin down
    if (A_PRIORKEY = "Tab" && (A_TickCount - LWinDownTime) < 500)
    {
        Send("{Blind}{Tab down}")  ; Hold Tab
        Send("{Blind}{Tab up}")    ; Release Tab to perform Alt+Tab
    }
    else
    {
        Send("{Blind}{LAlt up}")  ; Release LAlt if Tab wasn't pressed
        if (A_TickCount - LWinDownTime) < 250
        {
            Send("{LWin}")  ; Send LWin if pressed quickly (default behavior)
        }
    }

    ; Ensure LWin is released after logic completes
    Send("{Blind}{LWin up}")  ; Explicitly release LWin

    return
}

