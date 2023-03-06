/*
使用说明：
    1. 标点符号成对输入：在正常情况下按住WIN键
    2. 快捷键
        WIN+C：将剪贴板中的文本中的回车（换行）删除并存储到剪贴板中

*/


; 热字串
{
    ; :*: 不需要终止符(即空格、回车等) 来触发热字串
    ; :?: 即使此热字串在另一个单词中也会被触发
    ; :C: 区分大小写
    ; :O: 不输出终止符 
    :*:,,q::{end}{shiftdown}{home}{shiftup} ;全选当前行
    :*:,,d::{end}{shiftdown}{home}{shiftup}{Delete}{Delete} ;删除当前行
    :*:,,sfz::410724199806191050
    :*:,,zxh::张现华
    :*o:163ml::zxhhlbt@163.com
    :*o:11ml::1163986143@qq.com
    :*o:ggml::mariahwhyb@gmail.com
    :*o:-*/-::哈哈哈哈哈哈
    ; 英文缩写
    :o:idk::I don't know
    :o:wont::won't
    :o:dont::don't
    :o:youll::you'll
    :o:ty::thank you
    :o:plz::please
    :o:ill::I'll
    :o:ive::I've
    :o:ull::you'll
    :o:pls::please
    :o:idc::I don't care
    :o:cant::can't
    :o:didnt::didn't
    :o:couldnt::couldn't
    :o:wouldnt::wouldn't
    :o:shouldnt::shouldn't
    :o:shouldve::should've
}
;标点符号快速输入，按住WIN可以同时输入一对标点
{
    #[::send,[]{Left}
    #+[::send,{ShiftDown}[]{ShiftUp}{Left}
    #+(::send,(){Left}
    #+,::send,{ShiftDown},.{ShiftUp}{Left}
    #+'::send,{ShiftDown}''{ShiftUp}{Left}
}
; LaTeX公式输入
!m::
    Send, $$
    Send, {left}
Return
!+m::
    Send, $$$$
    Send, {left 2}
Return
; 快捷操作
#IfWinNotActive, ahk_exe CNEXT.exe
{
    ^+e::Run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OneNote.lnk
    ^+w::Run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk
    ^+delete::FileRecycleEmpty 	;清空回收站

    ; #c::delte_huanhang()

    ; 打开文件夹 Alt+Shift
    !+d::Run, D:\Download
    !+s::Run, D:\Study
    !+w::Run, D:\OneDrive - for personal\3 软件\0.0 Portable
    !+e::Run, D:\Software\S1 
    !+r::Run, D:\Software\S2
    !+v::Run, D:\OneDrive - for personal

    !e::Send, {Enter} ;alt+e  Enter
    !r::Send, {Enter}{Tab} ;alt+r  Enter+Tab
    
    ^+z::Send, ^y ;映射到反撤销
    #IfWinNotActive, ahk_exe MATLAB.exe
    {
        ^+x::Send, !{f4} ;关闭窗口，在matlab中simulink中用于注释模块
    }
    #IfWinNotActive, ahk_exe msedge.exe
    {
        ^+d::Run, C:\回收站 - 快捷方式.lnk ;打开回收站，在浏览器中用于批量添加文件夹
    }

} 
#IfWinNotActive, ahk_exe CNEXT.exe
; 只有两种选择，在这个应用中，或在其他所有范围内
{
    !a::
        if WinActive("ahk_exe" "GoldenDict.exe")
            Send,!{Up}
        Else
            Send, {Home}
    Return
    !f::
        if WinActive("ahk_exe" "GoldenDict.exe")
            Send,!{Down}
        Else
            Send, {End}
    Return
}
; 一样的功能，不一样的命令，部分应用适用，在其他范围内不能用
; 功能：
;   只在Office软件中
;   增大字号、减小字号、插入表格、居中、Delete、撤销、清除所有格式
#if Win_or_WinAcitve("ONENOTE.exe","WINWORD.exe","POWERPNT.exe","")
{
    ^LButton:: ;增大字号
        if WinActive("ahk_exe" "ONENOTE.exe")
            Send, ^+>
        if Win_or_WinAcitve("WINWORD.exe","POWERPNT.exe","","")
            Send, ^]
    Return
    +LButton:: ;减小字号
        if WinActive("ahk_exe" "ONENOTE.exe")
            Send, ^+<
        if Win_or_WinAcitve("WINWORD.exe","POWERPNT.exe","","")
            Send, ^[
    Return
    !t:: ;插入表格
        Send, !nt
    Return
    XButton1::Send {delete}
    XButton2::Send ^z
    !w:: ;清除所有格式
        if WinActive("ahk_exe" "ONENOTE.exe")
            Send, ^+n 
        if Win_or_WinAcitve("WINWORD.exe","POWERPNT.exe","","")
            send !he 
    Return
}

; 在浏览器中不同页面中的快捷键
#if StringInActiveTitle("YouTube")
{
    !w::Send, +< ; 调整youtube播放速度
    !e::Send, +> 
} 
#if StringInActiveTitle("DeepL")
{
    XButton1::Send {delete}
} 
#if

; 在OneNote中的快捷键
#IfWinActive ahk_exe ONENOTE.EXE
    {
    !q:: ;宋体
        MouseGetPos, x,y
        Send, !hff宋体{enter}
        Click x,y,1
    Return

    ^e::Send, {AltDown}hpc{AltUp} ; 居中
    ^w::Send, ^{Home} ; 回到开头
    !d::Send, ^. ;无序列表
    !g::Send, ^/ ;有序列表
    !+^w::Send, +!{Up} ;向上移动【ctrl+shfit+alt+w】
    !+^s::Send, +!{Down} ;向下移动【ctrl+shfit+alt+s】
    ^!q::Send, !wpc{Enter} ;背景颜色
    ^!w::Send, !hfca ;黑色
    ^!e::Send, !hfc{Down 7}{Enter} ;红色

    ; 用于数位屏
    ^+!e::Send, {AltDown}1{AltUp}
    ^+!r::Send, {AltDown}2{AltUp}
    ^+!q::Send, {AltDown}3{AltUp}
    ^+!t::Send, {AltDown}4{AltUp}
    ^+!y::Send, {AltDown}5{AltUp}
    ^+!u::Send, {AltDown}6{AltUp}
    ^+!p::Send , {Control Down}{WheelUp}{Control Up} ; 放大
    ^+!l::Send , {Control Down}{WheelDown}{Control Up} ; 缩小

    ; 需要包括2_FindText_Pic_tool\FindText.ahk文件
    ; 识别OneNote返回上一层的功能
    !z:: 
        MouseGetPos,Xxx,Yyy
        Text1:="|<>*210$11.ztzvw7wDwRwtslsVk3k7UCkxzvzby1UE"
        Text2:="|<>*192$10.TlzbUT1i6QMsVk70A1o7xtz8"
        if ok:=FindText(0,0,150000,150000,0,0,Text1)
        {
            FindText_Left_Click(ok,0,0,0)
        }
        else if ok:=FindText(0,0,150000,150000,0,0,Text2)
        {
            FindText_Left_Click(ok,0,0,0)
        }
        mousemove, Xxx,Yyy
    Return

    ; 下标
    !=::
        Send,{ShiftDown}{Left}{ShiftUp}
        Send,{CtrlDown}{=}{CtrlUp}
        Send, {Right}
        Send, {CtrlDown}{=}{CtrlUp}
    Return
    !+=::
        Send,{ShiftDown}{Left}{ShiftUp}
        Send,{CtrlDown}{ShiftDown}{=}{CtrlUp}{ShiftUp}
        Send, {Right}
        Send, {CtrlDown}{ShiftDown}{=}{CtrlUp}{ShiftUp}
    Return
}
#IfWinActive ahk_exe msedge.exe
{
    F2::
        Send, ^l{Left 3}
        Send, {Text}read:
        Send, {Enter}
    Return
}
#IfWinActive ahk_exe WeChat.exe
    {
        ; 删除微信对话框
    ^R::
        CoordMode, Mouse, Screen
        MouseGetPos,x,y
        click,,,right
        delete_msgbox1:="|<>*151$60.SwHkUz7nzyOhGFkGtE20OhGn8GVE20OhGa6SZE20OhGjzGZE20zzGUkGZLzzOhGEkSZE20OhGTyGxE70OhGEkGdE50GhHmoL9k8UGgG4quN0kEHAG8l2F1UAjNm3U2V603U"
        delete_msgbox2:="|<>*157$48.RmQEySTyJSIsJe1UJSJYJ+1UJSP6RO1UzyPzJOzzJSIERO1UJSLyJu1UJSIETu2ELGRIwi68qGGH5c8AjyEk78k3U"

        while 1
        {
            flag:=1
            ok1:=FindText(0,0,150000,150000,0,0,delete_msgbox1)
            ok2:=FindText(0,0,150000,150000,0,0,delete_msgbox2)
            if ok1 or ok2
            {
                FindText_Left_Click(ok1,0,0,0)
                FindText_Left_Click(ok2,0,0,0)
                flag:=0
            }
            if flag=0
            {
                Break
            }
        }
        MouseMove, x, y
    Return
}
#IfWinActive, ahk_exe ZhiyunTranslator.exe
    {
    !a:: ; 文本工具
        Text1:="|<>*180$23.00000000000000001k03uk014k028k04Ek08Uk0F0k0W0k140k280k4E0k8U0UF0T0W8k14kU2/lU4QV0y1W001A003k000000000000000000000000001"
        MouseGetPos, x1, y1
        ok1:=until_find(Text1)
        FindText_Left_Click(ok1,0,0,0)
        MouseMove, x1, y1
    Return
    !f:: ; 黄色高亮
        Text2:="|<>*182$14.0000000Ty6NVaM1U0M0601U0M0601U0M0TU0000000008"
        MouseGetPos, x1, y1
        ok1:=until_find(Text2)
        FindText_Left_Click(ok1,0,0,0)
        MouseMove, x1, y1
    Return
    !d:: ; 下划线
        Text3:="|<>*186$12.TyNaNa1U1U1U1U1U1U1U7s00zzU"
        MouseGetPos, x1, y1
        ok1:=until_find(Text3)
        FindText_Left_Click(ok1,0,0,0)
        MouseMove, x1, y1
    Return
}
#IfWinActive
