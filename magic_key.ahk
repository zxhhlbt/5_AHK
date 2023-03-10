


; 通用快捷键

!a::Send, {Home}
!f::Send, {End}
!e::Send, {Enter}


; Obsidian专用快捷键
#ifWinActive, ahk_exe Obsidian.exe
{
    ; 选中当前行
    !c::
        Send, {Home}
        Send, {ShiftDown}{End}{ShiftUp}
    Return

    ; 公式输入
    !g::
        Send, $$
        Send, {left}
    Return
    !+g::
        Send, $$$$
        Send, {left 2}
    Return
    ; 换行符输入
    !w::
        Send, {Text}<br>
    Return
}

; word专用快捷键
#IfWinActive, ahk_exe WINWORD.EXE
{
    ; 选中当前行
    !c::
        Send, {Home}
        Send, {ShiftDown}{End}{ShiftUp}
    Return
}