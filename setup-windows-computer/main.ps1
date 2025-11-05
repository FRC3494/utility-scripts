#!/usr/bin/env pwsh
Add-Type -AssemblyName UIAutomationClient
Add-Type -AssemblyName UIAutomationTypes

$year = "2025"
$downloadFolder = "$env:USERPROFILE\Downloads\FRC-Setup"
$wpilibVersion = "2025.3.2"
$elasticVersion = "2025.2.2"
$frcGameToolsVersion = "25.0"

function WPILib {
  $installUrl = "https://packages.wpilib.workers.dev/installer/v$wpilibVersion/Win64/WPILib_Windows-$wpilibVersion.iso"
  Invoke-WebRequest -Uri $installUrl -OutFile "$downloadFolder\WPILib_Windows-$wpilibVersion.iso"
  $diskImage = Mount-DiskImage -ImagePath "$downloadFolder\WPILib_Windows-$wpilibVersion.iso" -PassThru
  $driveLetter = ($diskImage | Get-Volume).DriveLetter

  Start-Process -FilePath "$($driveLetter):\WPILibInstaller.exe"
  Start-Process -FilePath "$PSScriptRoot\wpilib.exe" -Wait

  Start-Sleep -Seconds 1
  Dismount-DiskImage -ImagePath "$downloadFolder\WPILib_Windows-$wpilibVersion.iso"
}

function Elastic {
  $installUrl = "https://github.com/Gold872/elastic-dashboard/releases/download/v$elasticVersion/elastic-setup-windows.exe"
  Invoke-WebRequest -Uri $installUrl -OutFile "$downloadFolder\elastic-setup-windows.exe"

  Start-Process -FilePath "$downloadFolder\elastic-setup-windows.exe"
  Start-Process -FilePath "$PSScriptRoot\elastic.exe" -Wait
}

function FRCGameTools {
  $installUrl = "https://download.ni.com/support/nipkg/products/ni-f/ni-frc-$year-game-tools/$frcGameToolsVersion/online/ni-frc-$year-game-tools_$($frcGameToolsVersion)_online.exe"
  # Invoke-WebRequest -Uri $installUrl -OutFile "$downloadFolder\ni-frc-$year-game-tools_$($frcGameToolsVersion)_online.exe"

  Start-Process -FilePath "$downloadFolder\ni-frc-$year-game-tools_$($frcGameToolsVersion)_online.exe" -ArgumentList "/S" -Verb RunAs
  Start-Process -FilePath "$PSScriptRoot\frcGameTools.exe" -Wait
}

# WPILib
# Elastic
FRCGameTools