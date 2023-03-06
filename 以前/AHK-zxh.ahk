/*
注意：这是张现华的AHK脚本，如他人使用，请默念张现华最帅三遍然后再使用
*/
!Esc::Reload
SendMode Input
#SingleInstance force
SetWorkingDir, %A_ScriptDir%
#Include, 1_ZXH_AHK_Lib\AHK_Long.ahk
#Include, 1_ZXH_AHK_Lib\AHK_Function.ahk
#Include, 2_FindText_Pic_tool\FindText.ahk

; F17::
;     MsgBox,sleeptime
;     Delay_m(60)
;     Process, close, PotPlayerMini64.exe
; Return