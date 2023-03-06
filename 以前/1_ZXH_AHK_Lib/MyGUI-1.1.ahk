#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1
; *****************************基础*****************************
{
    Menu Tray, Icon, shell32.dll, 14
    Gui +Resize
    Gui Font, s12, Times New Roman
    Gui Color, 0xEAFFFF
    Gui Add, Tab3, x0 y0 w511 h417, Daily|Heart
    Gui Font
    Gui Font, s12, Times New Roman
}
; *****************************Tab1*****************************
Gui Tab, 1
{
    ; =========================网址==============================
    Gui Add, GroupBox, x144 y40 w181 h162, Web
    Gui Add, Link, x240 y72 w73 h24, <a href="https://www.autoahk.com/help/autohotkey/zh-cn/docs/AutoHotkey.htm">AHK Help</a>
    Gui Add, Link, x152 y112 w80 h24, <a href="https://www.youtube.com/">YouTube</a>
    Gui Add, Link, x152 y152 w66 h24, <a href="https://www.bilibili.com/watchlater/#/list">BBL</a>
    Gui Add, Link, x152 y72 w80 h24, <a href="https://www.bilibili.com">BiliBili</a>
    Gui Add, Link, x240 y112 w76 h24, <a href="https://www.ninwin.cn/">宁稳网</a>
    Gui Add, Link, x240 y152 w70 h26, <a href="https://matlab.mathworks.com/">Matlab</a>
    ; =========================Tools==============================
    Gui Add, GroupBox, x16 y40 w122 h161, Tools
    Gui Add, Button, gSleep x32 y152 w80 h30, Sleep
    Gui Add, Button, gCleanWindowss x32 y112 w80 h30, Clean
    Gui Add, Button, greloadd x32 y72 w80 h30, Reload
    ; =========================Switch==============================
    Gui Add, GroupBox, x16 y214 w460 h65, Switch
    Gui Add, CheckBox, gClash vClashh x32 y240 w80 h30, Clash
    Gui Add, CheckBox, gProxy x120 y240 w80 h30, Proxy
    Gui Add, CheckBox, gOcrr vOcr_state x208 y240 w69 h30, OCR
    Gui Add, CheckBox, gSnii vSni_state x296 y240 w97 h30, Snipaste
    ; =========================Dir==============================
    Gui Add, GroupBox, x336 y40 w120 h162, Dir
    Gui Add, Button, gAhk x344 y72 w80 h30, AHK
    Gui Add, Button, gBook x344 y112 w80 h30, Book
    ; =========================搜索==============================
    Gui Add, GroupBox, x16 y288 w460 h116, Search
    Gui Add, CheckBox, vBaidu x32 y312 w80 h30, BaiDu
    Gui Add, CheckBox, vGoogle x208 y312 w80 h30, Google
    Gui Add, CheckBox, vBing x120 y312 w74 h30 +checked, Bing
    Gui Add, CheckBox, vWikii x296 y312 w68 h30, WiKi
    Gui Add, CheckBox, vRunnobb x370 y312 w100 h30, RUNOOB
    ; 确保EDIT和Button的位置，保证按下tab可以到达搜索按钮
    Gui Add, Edit, vSearchContent x32 y344 w348 h41 
    Gui Add, Button, gSearchh x392 y344 w80 h44, GO
}
; *****************************Tab2*****************************
Gui Tab, 2
{
    Gui Font, s13
    Gui Add, Edit,vWritesomething x16 y100 w450 h300
    Gui Add, Text, x16 y52 w246 h42 +0x200, 需要记录点什么吗?
}
; *****************************NoTab****************************
{
    Gui Tab
    Gui Add, Text, x120 y424 w265 h33 +0x200, Have a Happy Day, Be Happy!
}
Return
; ***************************显示***************************
#IfWinNotActive, ahk_exe CNEXT.exe
{
    ^space::Gui Show, w480 h459, Happy a Happy Day
}
; *****************************Tab1*****************************
{
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
        if Wikii
        {
            RUN, https://zh.wikipedia.org/w/index.php?search=%SearchContent%
        }
        if Runnobb
        {
            RUN, https://www.runoob.com/?s=%SearchContent%
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
                Run D:\OneDrive - for personal\3 软件\0.0 Portable\6 VPN\Clash.for.Windows-0.19.11-win\Clash for Windows.exe
            }
            Else
            {
                Process, close, Clash for Windows.exe
            }
            Return
        Proxy:
            Send, ^+k
        Return
        Ocrr:
            Gui, Submit, NoHide
            if Ocr_state
            {
                Run D:\OneDrive - for personal\3 软件\0.0 Portable\1 Picture\tianruo_x64\TianruoOCR64.exe
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
        CleanWindowss:
            Run,D:\OneDrive - for personal\3 软件\clean.bat
            WinWait, ahk_exe cmd.exe
            WinMinimize, ahk_exe cmd.exe
        Return
        reloadd:
            Reload
        Return
        sleep:
        Return
    }
    ; ---------------------------DIR---------------------------
    {
        Book:
            Run, "D:\OneDrive - for personal\0 book"
        Return
        Ahk:
            Run, "D:\OneDrive - for personal\3 软件\9 ahk"
        Return
    }
}
; *****************************Tab2*****************************
{
    Deletee:
        Gui, Submit, NoHide
        Guicontrol,,Writesomething, 
    Return
}
; ---------------------------其他---------------------------
{
    GuiSize:
        If (A_EventInfo == 1) {
            Return
        }
    Return
    GuiClose:
        Gui, Cancel
    Return
}

