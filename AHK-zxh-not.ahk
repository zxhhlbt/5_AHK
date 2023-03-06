#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%



/* 
Youtube保存到播放列表，方便下载,浏览器放大110%，戴尔G3，不同设备临时调整参数
x1，y1为要保存的播放列表的坐标值，Sleep_time为每两步之间的睡眠时间，用于等待浏览器加载
*/
Youtube_BFLB(x1,y1,Sleep_time)
{
    MouseGetPos, xpos, ypos ;把鼠标放到三个点上
    If (xpos<1600) ;获取保存到播放列表的x坐标值
    {
        xx2 := xpos + 113 
    }Else
    {
        xx2 := xpos - 107
    }
    yy2 := ypos + 167 ;获取保存到播放列表的y坐标值
    click,%xpos%,%ypos% 
    Sleep, Sleep_time
    click,%xx2%,%yy2% ;点击保存到播放列表
    Sleep, Sleep_time
    click,%x1%,%y1% ;选中要保存的播放列表
    Sleep, Sleep_time
    click,1041,314 ;点击关闭
    Return
}
^+v::Youtube_BFLB(881,488,200)

; 自动热字串获取
#!h::  ; Win+alt+H 热键
{
    ; 获取当前选择的文本. 使用剪贴板代替
    ; "ControlGet Selected", 是因为它可以工作于更大范围的编辑器
    ; (即文字处理软件). 保存剪贴板当前的内容
    AutoTrim Off  ; 保留剪贴板中任何前导和尾随空白字符.
    ClipboardOld := ClipboardAll
    Clipboard := ""  ; 必须清空, 才能检测是否有效.
    Send ^c
    ClipWait 1
    if ErrorLevel  ; ClipWait 超时.
        return
    ; 替换 CRLF 和/或 LF 为 `n 以便用于 "发送原始模式的" 热字串:
    ; 对其他任何在原始模式下可能出现问题
    ; 的字符进行相同的处理:
    StringReplace, Hotstring, Clipboard, ``, ````, All  ; 首先进行此替换以避免和后面的操作冲突.
    StringReplace, Hotstring, Hotstring, `r`n, ``r, All  ; 在 MS Word 等软件中中使用 `r 会比 `n 工作的更好.
    StringReplace, Hotstring, Hotstring, `n, ``r, All
    StringReplace, Hotstring, Hotstring, %A_Tab%, ``t, All
    StringReplace, Hotstring, Hotstring, `;, ```;, All
    Clipboard := ClipboardOld  ; 恢复剪贴板之前的内容.
    ; 这里会移动输入框的光标到更人性化的位置:
    SetTimer, MoveCaret, 10
    ; 显示输入框, 提供默认的热字串:
    InputBox, Hotstring, New Hotstring, Type your abreviation at the indicated insertion point. You can also edit the replacement text if you wish.`n`nExample entry: :R:btw`::by the way,,,,,,,, :R:`::%Hotstring%
    if ErrorLevel  ; 用户选择了取消.
        return
    if InStr(Hotstring, ":R`:::")
    {
        MsgBox You didn't provide an abbreviation. The hotstring has not been added.
        return
    }
    ; 否则添加热字串并重新加载脚本:
    FileAppend, `n%Hotstring%, %A_ScriptFullPath%  ; 在开始处放置 `n 以防文件末尾没有空行.
    Reload
    Sleep 200 ; 如果加载成功, reload 会在 Sleep 期间关闭当前实例, 所以永远不会执行到下面的语句.
    MsgBox, 4,, The hotstring just added appears to be improperly formatted. Would you like to open the script for editing? Note that the bad hotstring is at the bottom of the script.
    IfMsgBox, Yes, Edit
    return

    MoveCaret:
    if not WinActive("New Hotstring")
        return
    ; 否则移动输入框中的光标到用户输入缩写的位置.
    Send {Home}{Right 3}
    SetTimer, MoveCaret, Off
    return
}

; ; 1. 设置路径变量，为后面简写
; note=C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Notepad++
; ; 2. 进行操作
; !c::
; {
;     inputBox,command,enter command                                                          
;         if ErrorLevel                                                                            
;             return  
;         else
;             if (command=="note") ;打开notepad++ 
;                 run %note%  
;             else if (command=="bd")
;                 run http://www.baidu.com  ;;; 快速打开百度
;             else if (command=="bi")
;         return
; }

; #IfWinActive, ahk_exe Obsidian.exe
; {
;     ^a::Send,{end}{shiftdown}{home}{shiftup} ;全选当前行
;     XButton1::Send, {delete}
;     !d::Send, ^.
;     !g::Send, ^/
    
;     ^!e::
;         Send ^c
;         wait_text:=clipboard
;         Needle := "<font"
;         If InStr(wait_text, Needle)
;         {
;             replace_needle:="<font color=red"
;             MyString :=StrReplace(wait_text,Needle,replace_needle)
;             clipboard:=MyString
;             Send ^v
;         } 
;         Else
;         {
;             text_head=<font color=red>
;             text_tail=</font>
;             clipboard:=text_head wait_text text_tail
;             Send ^v
;         } 
;     Return  
; }