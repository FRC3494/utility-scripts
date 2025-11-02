#!/usr/bin/env pwsh
Add-Type -AssemblyName UIAutomationClient
Add-Type -AssemblyName UIAutomationTypes

$downloadFolder = "$env:USERPROFILE\Downloads\FRC-Setup"
$wpilibVersion = "2025.3.2"

$wshell = New-Object -ComObject wscript.shell

function WPILib {
  $installUrl = "https://packages.wpilib.workers.dev/installer/v$wpilibVersion/Win64/WPILib_Windows-$wpilibVersion.iso"
  # Invoke-WebRequest -Uri $installUrl -OutFile "$downloadFolder\WPILib_Windows-$wpilibVersion.iso"
  $diskImage = Mount-DiskImage -ImagePath "$downloadFolder\WPILib_Windows-$wpilibVersion.iso" -PassThru
  $driveLetter = ($diskImage | Get-Volume).DriveLetter

  Start-Process -FilePath "$($driveLetter):\WPILibInstaller.exe"
  Start-Process -FilePath "$PSScriptRoot\wpilib.exe" -Wait

  Start-Sleep -Seconds 5
  Dismount-DiskImage -ImagePath "$downloadFolder\WPILib_Windows-$wpilibVersion.iso"
}

WPILib
