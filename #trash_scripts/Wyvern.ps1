# Wyvern is supposed to be a more dynamic script, where Begone.ps1 was a static script with prestated commands.

$ScriptVersion = "V1 - 06/15/19"
$Author = "Built by SB-Ansel"
$Hostname = whoami
$color = $host.ui.RawUI.ForegroundColor

Clear-Host # Clears previous entered commands from the PS windows.
Write-Host ''
Write-Host '***********************************************************'
Write-Host '*                                                         *'
Write-Host '*        Wyvern - Windows Built-in Apps remover           *'
Write-Host '*        USE AT YOUR OWN RISK                             *'
Write-Host "*        $ScriptVersion                             *"
Write-Host "*        $Author                                *"
Write-Host '*                                                         *'
Write-Host '***********************************************************'
Write-Host ''

$host.ui.RawUI.ForegroundColor = "Yellow"
Write-Host "Current Device/User: $Hostname"
$host.ui.RawUI.ForegroundColor = $color
Write-Host ''
Write-Host '--Windows Installation check--------------------------------'.ToUpper()

    # System environment check.
function WindowsEnvironmentCheck(){
    If ($env:SystemDrive -eq "C:" -And $env:SystemRoot -eq "C:\Windows"){
        $host.ui.RawUI.ForegroundColor = "Green"
        Write-Host 'Windows environment check: Okay!'
        $host.ui.RawUI.ForegroundColor = $color
        # Write-Host 'Number of deleted apps: ', (Get-ChildItem 'C:\Program Files\WindowsApps\DeletedAllUserPackages').Count
        # Write-Output ''
      }
      Else {
        $host.ui.RawUI.ForegroundColor = "Red"
        Write-Host 'Windows environment check: Fail!'
        $host.ui.RawUI.ForegroundColor = $color
        Write-Host 'Finding destination to route.'
        $env:SystemDrive
      }
}
WindowsEnvironmentCheck



# DISM /Online /Get-ProvisionedAppxPackages | select-string PackageName //This will check the current windows image for packages known to this image. 

https://blog.danic.net/provisioned-apps-in-windows-10-pro/


@'
$int = 1
$Appx = (DISM /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Sort PackageName)
$Appx = $Appx -replace('PackageName','')
$Appx = $Appx -replace('Microsoft','')
$Appx = $Appx -replace(':','')
$Appx = $Appx -replace(' ','')
$Appx | ForEach{Write-Host ([int]$int++) :> $_}
@'