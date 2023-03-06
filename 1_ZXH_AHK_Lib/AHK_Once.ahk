/*
功能：
    使用CRTubeGet下载视频时用于取消不要的视频
    暂停：长按鼠标左键
*/
F17::
    flag:=0
    Text1:="|<>*140$23.000000003zw0Dzw0zzw1zzs3zzk7zzUDzD0Twy0znw1xDs3szk7zzUDzz0Tzy0Tzs0TzU0001"
    while 1
    {
        if_over:=1
        while ok:=FindText(0,0,150000,150000,0,0,Text1)
        {
            FindText_Left_Click(ok,0,0,0)
            if_over:=0
        }
        Send, {WheelDown}
        Sleep, 50 ; 一定要等一下，等待屏幕向下划过去
        flag:=GetKeyState("ctrl")
        if(flag or if_over)
        {
            break
        }
    }
Return

/*
功能：
    将YouTube里面的视频添加到ing播放列表中，等待下载或以后观看
注意：
    ing需要根据情况更改
*/
F17::
    three_point:="|<>*80$14.000000000000001k0Q070000000000000701k0Q0000000000000Q0701k000000000000008"
    save:="|<>*141$27.zzwQ0003U000Q0003U000Q7zlzzzwTzs01zz000Q0003U000Q7zk3U000Q4"
    ing:="|<>*169$25.000000000000000000000M000A000000000001Ww3olr3iMkX3AENVa8Akn46MNW3AAl1a6MUlrAEMTU000k000M00CM001s0000000000008"
    Closes:="|<>*151$19.k01w01b01Vk1UQ1U71U1lU0RU07U01k00w00b00Vk0UQ0U70U1kU0QU07U01k"
    send {esc}
    ; 选中三个点
    Sleep, 100
    ok1:=until_find(three_point)
    FindText_Left_Click(ok1,0,0,0)
    ; 选添加到播放列表
    ok2:=until_find(save)
    FindText_Left_Click(ok2,0,0,0)
    ; 添加到ing
    ok3:=until_find(ing)
    FindText_Left_Click(ok3,0,0,0)
    ; 关闭
    if ok4:=until_find(Closes)
    FindText_Left_Click(ok4,0,0,0)
Return

!q::
{
    CoordMode, Menu, Screen
    CoordMode, Mouse, Screen

    Menu, zxhzs, add, Read_Mode
    Menu, zxhzs, add
    Menu, zxhzs, add,Task_Manager
    Menu, zxhzs, add
    Menu, zxhzs, Add, CLOSE_THIS_WIN
    
    ; Menu, zxhzs, 

    ; 菜单显示位置 
    MouseGetPos,MX,MY
    Menu,zxhzs,Show,% MX,% MY
    Menu,zxhzs,DeleteAll
    
    Return
    {
        Task_Manager:
            Send,^+{Esc}
        Return
        CLOSE_THIS_WIN:
            Send, {Esc}
        Return
    }
    ; 菜单显示
   
}