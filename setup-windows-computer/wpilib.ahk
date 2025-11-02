#Requires AutoHotkey v2.0

WinWait("WPILib Installer")
WinActivate("WPILib Installer")
WinWaitActive("WPILib Installer")

WinGetClientPos &x, &y, &width, &height, "WPILib Installer"

Click(width * 0.92, height * 0.92) ; Start
Sleep(1000)

Click(width * 0.34, height * 0.56) ; Install for this User
Sleep(1000)

Click(width * 0.21, height * 0.56) ; Download for this computer only
loop {
    Sleep(1000)
} until (PixelGetColor(width * 0.92, height * 0.92, "WPILib Installer") != 0xffffff)

Click(width * 0.92, height * 0.92) ; Next
loop {
    Sleep(1000)
    WinActivate("WPILib Installer")
    if (PixelGetColor(width * 0.92, height * 0.92, "WPILib Installer") != 0xffffff) {
        if (WinActive("WPILib Installer") != 0) {
            break
        }
    }
}

Click(width * 0.92, height * 0.92) ; Finish
Sleep(1000)

ExitApp