#Requires AutoHotkey v2.0
#NoTrayIcon
#SingleInstance Force

;Home::Send("{Wheelup 1}")
;End::Send("{Wheeldown 1}")
Control & Up::Send("{Wheelup 1}")
Control & Down::Send("{Wheeldown 1}")

#SingleInstance Force        ;Run only one instance

*F10::{                      ;Main Func (toggle 'w')
  If GetKeyState("w")        ;    Is 'w' is held?
    Send("{Blind}{w Up}")    ;      Release it
  Else                       ;    Or, if NOT held
    Send("{Blind}{w Down}")  ;      Hold it
}  