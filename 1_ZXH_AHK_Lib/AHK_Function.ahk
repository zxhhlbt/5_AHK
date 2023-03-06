/*
功能：
    检测目前窗口标题是否有目标字符串
使用方法：检查当前窗口标题中是否含有“YouTube”
    #if StringInActiveTitle("YouTube")
    ...do whatever you want do
    #if
*/
StringInActiveTitle(String)
{
    WinGetActiveTitle,WinTitle
    IfInString, WinTitle, %String%
    { 
        return True
    }
    else
    {
        return False
    }
}
/*
功能：
    将剪贴板中的文本中的回车（换行）删除并存储到剪贴板中
*/
delte_huanhang()
{
    texttt:=clipboard
    Replacetext55 := StrReplace(texttt,"`r`n")
    clipboard:=Replacetext55
}

/*
功能：
    在当前屏幕上寻找路径中的图片并点击
参数说明：
    LU:left up 左上角、RD：right down 右下角
    x_LU,y_LU,x_RD,y_RD是屏幕的检测范围
    x_offset,y_offset是偏移位置，针对图片左上角的偏移
*/
Find_Pic_and_Click(Pic_Path,x_LU,y_LU,x_RD,y_RD,x_offset,y_offset)
{
    if FileExist(Pic_Path)
    {
        CoordMode Pixel Screen
        CoordMode Mouse Screen 
        ;找图片,获取左上角坐标
        ImageSearch, Pic_X, Pic_y, x_LU, y_LU, x_RD, y_RD,%Pic_Path%
        if (ErrorLevel=0) {
            Pic_X+=x_offset
            Pic_y+=y_offset
            Click %Pic_X%, %Pic_y%
        } else {
            Return
        }
    } else
    {
        MsgBox, "sorry, can't find the pic"
        Return
    }
}

/*
功能：
    截图并保存到桌面
*/
just_snip(x_LU,y_LU,x_RD,y_RD)
{
    Current_Time=--%A_MM%-%A_DD%-%A_Hour%-%A_Min%-%A_Sec%
    Send, {AltDown}s{AltUp}
    Sleep, 66
    MouseClickDrag, left, x_LU, y_LU, x_RD, y_RD
    Sleep, 120
    Send, ^s
    Sleep, 88
    Send, %Current_Time%
    Sleep, 21
    Send, {Enter}
    Return Current_Time
}
/*
功能：
    获取鼠标左上角坐标和右下角坐标：x_LU, y_LU, x_RD, y_RD
    通过数组返回鼠标四个坐标值
使用方法：
    Mouse_Pos:=Get_XY_LeftUP_RightDown()
    x1:=Mouse_Pos[1]
    y2:=Mouse_Pos[2]
    x2:=Mouse_Pos[3]
    y2:=Mouse_Pos[4]
    MsgBox, %x1%-%x2%--%x3%-%x4%
*/
Get_XY_LeftUP_RightDown()
{
    Mouse_Pos:=[]
    ; 检测鼠标按下（此时不要松开）
    KeyWait, LButton, D
    MouseGetPos, x1_LU, y1_LU
    ; 检测鼠标松开（此时松开鼠标）
    KeyWait, LButton, U
    MouseGetPos, x2_LU, y2_LU

    Mouse_Pos[1]:=x1_LU
    Mouse_Pos[2]:=y1_LU
    Mouse_Pos[3]:=x2_LU
    Mouse_Pos[4]:=y2_LU
    Return Mouse_Pos
}



/*
介绍：
    查看是否激活以下四个窗口之一
    如果其中一个在激活状态，则返回true
参数：
    exe1-4为ahk_exe
*/
Win_or_WinAcitve(exe1,exe2,exe3,exe4)
{
    flag:=0
    if WinActive("ahk_exe" exe1)
        flag:=flag+1
    if WinActive("ahk_exe" exe2)
        flag:=flag+1
    if WinActive("ahk_exe" exe3)
        flag:=flag+1
    if WinActive("ahk_exe" exe3)
        flag:=flag+1
    Return flag
}
/*
介绍：
    延时函数，单位秒
*/
Delay_s(delay_second)
{
    loop %delay_second%
    {
        Sleep, 999
    }
}
Delay_m(delay_second)
{
    loop %delay_second%*60
    {
        Sleep, 999
    }
}
/*
功能：
    指定范围截图，并将图片保存，文件名为：年-月-日-时-分-秒
参数说明
    mid_sleep：
        若自动截图，每两次之间间隔的秒数
    sni_times:截图次数
        若手动截图，参数为1
        若自动截图，输入大于1的数
    destination_dir：
        图片要移动到的目标文件夹
        如果只想把图片保存到桌面，则为空字符串：“”
    win_active:
        通过ahk_exe激活指定窗口
        如果不想激活特定窗口，则为空字符串：“”
函数应用示例：
    ^3::ScreenShoot(5,3,"","")
    ^3::ScreenShoot(5,3,"D:\Download","Code.exe")
前提：
    打开截图软件，snipaste，快捷键设置为alt+s
    默认保存位置设置为桌面
    default_dir:="C:\Users\Administrator\Desktop\" 需要确定默认位置
注意：坐标相对还是绝对的....
*/
ScreenShoot(sni_times,mid_sleep,destination_dir,win_active)
{ 

    CoordMode, Mouse, Screen

    default_dir:="C:\Users\Administrator\Desktop\"
    MsgBox, Ready for get the snipping area,`n press the left button,`n drag the area u wanna snip, `n and loose the button
    Mouse_Pos:=Get_XY_LeftUP_RightDown()
    x_LU:=Mouse_Pos[1]
    y_LU:=Mouse_Pos[2]
    x_RD:=Mouse_Pos[3]
    y_RD:=Mouse_Pos[4]
    MsgBox, snipping area:(%x_LU%,%y_LU%)(%x_RD%,%y_RD%)
    flag_mouse:=1

    If (win_active!="")
    {
        WinActivate,ahk_exe %win_active%
    }

    loop %sni_times%
    {
        file_name:=just_snip(x_LU, y_LU, x_RD, y_RD)
        If (destination_dir!="")
        {
            Sleep, 600
            default_pic_dir:=default_dir file_name ".png" ;连接字符串的操作很迷
            FileMove, %default_pic_dir%, %destination_dir%
        }
        if(sni_times>1)
        {
            Delay_s(mid_sleep)
        }
    }

}

/*
功能：
    使用Find_pic工具，直到找到目标图片，才结束
返回：
    返回那个对象
*/
until_find(xxx)
{
    While 1
    {
        if okkk:=FindText(0,0,150000,150000,0,0,xxx)
        {
            Break
        }
        Else
        {
            Sleep, 50
        }
    }
    Return okkk
}