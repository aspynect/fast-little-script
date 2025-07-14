#SingleInstance Force
SetTitleMatchMode, 2
#InstallKeybdHook
gameWindow := "ahk_exe DELTARUNE.exe"
shiftToggled := false
physCtrlDown := false
numpadEnterToggled := false
inGame := false
SetTimer, CheckWindow, 100

; checks for window focus
CheckWindow:
IfWinActive, %gameWindow%
{
    if (!inGame) {
        if (!physCtrlDown)
            SendInput, {Ctrl down}
        if (shiftToggled)
            SendInput, {Shift down}
        else
            SendInput, {Shift up}
        if (numpadEnterToggled)
            SendInput, {NumpadEnter down}
        else
            SendInput, {NumpadEnter up}
        inGame := true
    }
}
else
{
    if (inGame) {
        SendInput, {Ctrl up}
        SendInput, {Shift up}
        SendInput, {NumpadEnter up}
        inGame := false
    }
}
return

; toggle shift
*Shift::
if (WinActive(gameWindow)) {
    shiftToggled := !shiftToggled
    if (shiftToggled) {
        SoundBeep, 750, 100
        SendInput, {Shift down}
    } else {
        SoundBeep, 400, 100
        SendInput, {Shift up}
    }
    return
} else {
    Send, {Blind}{Shift Down}
}
return

*Shift up::
if (!WinActive(gameWindow)) {
    Send, {Blind}{Shift Up}
}
return

; numenter toggle
*NumpadEnter::
if (WinActive(gameWindow)) {
    numpadEnterToggled := !numpadEnterToggled
    if (numpadEnterToggled) {
        SoundBeep, 1000, 100
        SendInput, {NumpadEnter down}
    } else {
        SoundBeep, 500, 100
        SendInput, {NumpadEnter up}
    }
    return
} else {
    Send, {Blind}{NumpadEnter Down}
}
return

*NumpadEnter up::
if (!WinActive(gameWindow)) {
    Send, {Blind}{NumpadEnter Up}
}
return

; holding ctrl turns off ctrl while held
*Ctrl::
if (WinActive(gameWindow)) {
    physCtrlDown := true
    SendInput, {Ctrl up}
    return
} else {
    Send, {Blind}{Ctrl Down}
}
return

*Ctrl up::
if (WinActive(gameWindow)) {
    physCtrlDown := false
    SendInput, {Ctrl down}
    return
} else {
    Send, {Blind}{Ctrl Up}
}
return

; exit
~Esc::ExitApp