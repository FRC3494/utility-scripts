#Requires AutoHotkey v2.0

WinWait("Setup - Elastic ")
WinActivate("Setup - Elastic ")
WinWaitActive("Setup - Elastic ")

WinGetClientPos &x, &y, &width, &height, "Setup - Elastic "

Click(width * 0.08, height * 0.81) ; I accept the agreement
Sleep(500)
Click(width * 0.78, height * 0.95) ; Next
Sleep(1000)

Click(width * 0.78, height * 0.95) ; Next
Sleep(1000)

Click(width * 0.78, height * 0.95) ; Install
loop {
    Sleep(1000)
} until (PixelGetColor(width * 0.78, height * 0.95, "Setup - Elastic ") != 0xf0f0f0)

Click(width * 0.40, height * 0.35) ; Launch Elastic
Sleep(500)
Click(width * 0.78, height * 0.95) ; Finish
Sleep(1000)