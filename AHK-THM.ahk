#SingleInstance force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#Include, 3_Tap_Hold_Manager\TapHoldManager.ahk

thm := new TapHoldManager() ;初始化Tap Hold Manager
thm.Add("Alt", Func("My1"))
My1(isHold, taps, state){
	if(isHold=0)&(taps=1)&(state)
    {
        Send, Hello
    }
	if(isHold=0)&(taps=2)&(state)
    {
        Send, Hello,Taps=2
    }
}