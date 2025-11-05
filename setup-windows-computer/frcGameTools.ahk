#Requires AutoHotkey v2.0

WinWait("NI Package Manager")
WinActivate("NI Package Manager")
WinWaitActive("NI Package Manager")
WinGetClientPos &x, &y, &width, &height, "NI Package Manager"
; 757 x 506

loop {
    Sleep(1000)
} until (PixelGetColor(width * 0.64, height * 0.82, "NI Package Manager") == 0x61696f)
MsgBox("1")
Sleep(500)
Click(width * 0.64, height * 0.82) ; I accept the above 2 license agreements
Sleep(500)
Click(width * 0.89, height * 0.91) ; Next
Sleep(1000)

Click(width * 0.89, height * 0.91) ; Next
Sleep(1000)

WinWait("Installing FRC Game Tools")
WinActivate("Installing FRC Game Tools")
WinWaitActive("Installing FRC Game Tools")
WinGetClientPos &x, &y, &width, &height, "Installing FRC Game Tools"