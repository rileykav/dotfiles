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
#t::^t



LWin & Tab::
{
    Send("{LAlt Down}{Tab}")          
    KeyWait("LWin")  ; Wait for Left Win key to be released
    Send("{LAlt Up}") ; Close switcher on hotkey release
}

