#Requires AutoHotkey v2.0
#NoTrayIcon
#SingleInstance Force

; See https://www.reddit.com/r/vim/comments/1442ads/mapping_capslock_to_esc_is_life_changing/jniswsk/ for v1 version

; Map Capslock to Control
; Map press & release of Capslock with no other key to Esc
; Press both shift keys together to toggle Capslock


*Capslock::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    Send("{Blind}{LControl down}")
    CapsDownTime := A_TickCount
    KeyWait("Capslock")

    Send("{Blind}{LControl up}")
    if (A_PRIORKEY = "CapsLock")
    {
        if (A_TickCount - CapsDownTime) < 250
        {
                Send("{Esc}")
        }

    }
    return
} ; V1toV2: Added bracket before function

ToggleCaps(){
    ; this is needed because by default, AHK turns CapsLock off before doing Send
    SetStoreCapsLockMode(false)
    Send("{CapsLock}")
    SetStoreCapsLockMode(true)
    return
}
LShift & RShift::ToggleCaps()
RShift & LShift::ToggleCaps()

; ^!r::Reload