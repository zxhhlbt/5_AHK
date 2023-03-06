﻿; Generated by Auto-GUI 3.0.1
#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1

Menu Tray, Icon, shell32.dll, 14

Gui +Resize
Gui Font, s12, Times New Roman
Gui Color, 0xF4F4FF

; =======================================================
; 功能：搜索文本框的内容，百度、必应、Google
; =======================================================
Gui Add, Edit, vSearchContent x48 y344 w285 h30
Gui Add, Button, gSearchh x352 y336 w80 h41, Search
Gui Add, GroupBox, x24 y272 w427 h137, Search
Gui Add, CheckBox, vBaidu x40 y312 w79 h23 +checked, BaiDu
Gui Add, CheckBox, vBing x144 y312 w71 h23 +checked, Bing
Gui Add, CheckBox, vGoogle x232 y312 w86 h23, Google
; =======================================================
; 功能：看视频
; =======================================================
Gui Add, GroupBox, x192 y32 w139 h163, Video
Gui Add, Button, gyt x216 y64 w80 h23, YouTube
Gui Add, Button, gbb x216 y96 w80 h23, BiliBili
Gui Add, Button, gbbl x216 y128 w80 h23, BBLater
Gui Add, Button, galp x216 y160 w80 h23, AliPan
; =======================================================
; 功能：开关
; =======================================================
Gui Add, GroupBox, x24 y208 w414 h56, Switch
Gui Add, CheckBox, gClash vClashh x48 y232 w65 h23, Clash
Gui Add, CheckBox, gVPN x140 y232 w65 h23, Proxy
Gui Add, CheckBox, gOcrr vOcr_state x232 y232 w60 h23, OCR
Gui Add, CheckBox, gSnii vSni_state x320 y232 w103 h23, Snipaste
; =======================================================
; 功能：工具
; =======================================================
Gui Add, GroupBox, x16 y32 w161 h165, Tools
Gui Add, Button, gKillAll x24 y112 w91 h33, KillAll
Gui Add, Button, gCleanWindowss x24 y72 w145 h32, Clean Windows
Gui Add, Button, gSleep x24 y160 w80 h23, Sleep
; =======================================================
; 功能：学习
; =======================================================
Gui Add, GroupBox, x352 y32 w109 h134, Study
Gui Add, Button, gAhk_help x360 y128 w93 h29, AHK Help
Gui Add, Button, gAhk x360 y64 w80 h23, AHK
Gui Add, Button, gBook x360 y96 w80 h23, Book
; =======================================================
Gui Add, Text, x136 y416 w162 h32 +0x200, Have a happy Day!
Gui Add, Button, gCloses x376 y424 w80 h23, Close
Return

; ***************************显示***************************
^space::Gui Show, w480 h459, Happy Every Day
; ---------------------------视频---------------------------
{
    yt:
        Run, "https://www.youtube.com/"
    Return
    bb:
        Run, "https://www.bilibili.com"
    Return
    bbl:
        Run, "https://www.bilibili.com/watchlater/#/list"
    Return
    alp:
        Run, "https://www.aliyundrive.com/drive/"
    Return
}
; ---------------------------搜索---------------------------
Searchh:
    ; submit还不懂
    Gui, Submit, NoHide

    if Baidu
    {
        RUN, https://www.baidu.com/s?wd=%SearchContent%
    }
    if Bing
    {
        RUN, https://cn.bing.com/search?q=%SearchContent%
    }
    if Google
    {
        RUN, https://www.google.com/search?q=%SearchContent%
    }
    Gui, Cancel
    Guicontrol,,SearchContent,
Return
; ---------------------------switch-------------------------
{
    Clash:
        Gui, Submit, NoHide
        if Clashh
        {
            Run D:\OneDrive - for personal\3 软件\0.0 Portable\6 VPN\Clash.for.Windows-0.19.0-win\Clash for Windows.exe
        }
        Else
        {
            Process, close, Clash for Windows.exe
        }
        Return
    VPN:
        Send, ^+k
    Return
    Ocrr:
        Gui, Submit, NoHide
        if Ocr_state
        {
            Run D:\OneDrive - for personal\3 软件\0.0 Portable\1 Picture\天若OCR_x64\TianruoOCR64.exe
        }
        Else
        {
            Process, close, TianruoOCR64.exe
        }
    Return
    Snii:
        Gui, Submit, NoHide
        if Sni_state
        {
            Run D:\OneDrive - for personal\3 软件\0.0 Portable\1 Picture\Snipaste-2.2.3-Beta-x64\Snipaste.exe
        }
        Else
        {
            Process, close, Snipaste.exe
        }
    Return
}
; ---------------------------工具---------------------------
{
    Sleep:

    Return
    CleanWindowss:
        Run,D:\OneDrive - for personal\3 软件\clean.bat
        WinWait, ahk_exe cmd.exe
        WinMinimize, ahk_exe cmd.exe
    Return
    KillAll:
    Return
}
; ---------------------------学习---------------------------
{
    Book:
        Run, "D:\OneDrive - for personal\0 book"
    Return
    Ahk:
        Run, "D:\OneDrive - for personal\3 软件\9 ahk"
    Return
    Ahk_help:
        Run, "https://www.autoahk.com/help/autohotkey/zh-cn/docs/AutoHotkey.htm"
    Return
}
; ---------------------------其他---------------------------
{
    Closes:
        Reload
    Return
    GuiSize:
        If (A_EventInfo == 1) {
            Return
        }
    Return

    GuiClose:
        Gui, Cancel
    Return
}