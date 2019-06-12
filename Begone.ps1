$softwareVersion = "Version 2.0 - 06-11-2019"
$hostname = whoami
$Author = "Built by SB-Ansel"
# $osString = systeminfo | findstr /B /C:"OS Name" /C:"OS Name" - Slows the script down, might reimplement later.

Clear-Host
    Write-Output ' ***********************************************************'
    Write-Output ' *                                                         *'
    Write-Output ' *        Begone - Windows Built-in Apps remover           *'
    Write-Output ' *        USE AT YOUR OWN RISK                             *'
    Write-Output " *        $softwareVersion                         *"
    Write-Output " *        $Author                                *"
    Write-Output ' *                                                         *'
    Write-Output ' ***********************************************************'
    Write-Output ''

$color = $host.ui.RawUI.ForegroundColor
    $host.ui.RawUI.ForegroundColor = "Yellow"
    Write-Output " Current Device/User : $hostname"
    $host.ui.RawUI.ForegroundColor = $color
    # Write-Output " Operating System : $osString"
    Write-Output ''
    Write-Output '--Windows Installation check--------------------------------'.ToUpper()
#Pre test environment
function PreInitialization{
  #Windows installation check
If ($env:SystemDrive -eq "C:" -And $env:SystemRoot -eq "C:\Windows"){
  Write-Host 'Standard Windows installation'
  Write-Host 'Number of deleted apps: ', (Get-ChildItem 'C:\Program Files\WindowsApps\DeletedAllUserPackages').Count
  Write-Output ''
}
Else {
  'Non-standard Windows installation.. all bets are off brother.'
}
Start-Sleep -milliseconds 500 
#Pre Initialization
$Preinit = Get-ExecutionPolicy
Write-Host '--Windows Policy Check--------------------------------------'.ToUpper()
if ($Preinit -eq 'Unrestricted'){
    Write-Host 'Current policy set to: Unrestricted'
} 
Elseif ($Preinit -eq 'RemoteSigned'){
  Write-Host 'Current policy set to: RemoteSigned'
}
Elseif ($Preinit -eq 'AllSigned'){
  Write-Host 'Current policy set to: AllSigned'
  $policy = Read-Host 'Warning: Your current system execution policy only allows signed scripts to run, would you like too turn on unrestricted execution policy? y/n '
  if ($policy -eq 'y'){
    Set-ExecutionPolicy -Scope CurrentUser Unrestricted
    Start-Sleep -milliseconds 500
    $GetPolicy = Get-ExecutionPolicy
    if ($GetPolicy -eq 'Unrestricted'){
      Write-Host $GetPolicy
      Start-Sleep -milliseconds 500
    }
    else{
      Write-Host 'Something went wrong :/'
      Write-Host 'Try running Set-ExecutionPolicy -Scope CurrentUser Unrestricted from an Administrtive PowerShell'
      Start-Sleep -milliseconds 750
      Clear-Host
      exit
    }
  } 
  Elseif ($policy -ne 'y'){
    Write-Host 'Exiting...'
    Start-Sleep -milliseconds 500
    Clear-Host
    exit
    } 
  }
else{
  Write-Host 'Unknown Execution Policy, Exiting'
  Start-Sleep -milliseconds 500
  Clear-Host
  exit
}
}

PreInitialization
#Initalization
''
'[1] *bingfinance*'
'[2] *bingnews*'
'[3] *bingsports*'
'[4] *bingweather*'
'[5] *gethelp*'
'[6] *getstarted*'
'[7] *messaging*'
'[8] *mspaint*'
'[9] *officehub*'
'[10] *oneconnect*'
'[11] *onenote*'
'[12] *people*' 
'[13] *print3d*'#look at this one
'[14] *skypeapp*'
'[15] *solitairecollection*'
'[16] *StickyNotes*'
'[17] *soundrecorder*'
'[18] *windowscamera'
'[19] *windowsfeedbackhub*'
'[20] *windowsmaps*'
'[21] *windowsphone*'
'[22] *windowsalarms*'
'[23] *xboxapp*'
'[24] *zunemusic*'
'[25] *zunevideo*'
'[26] *3dbuilder*'
'[27] *3dviewer*'#look at this one
''
'[u] Uninstall all apps in list'
'[r] Reinstall all apps in list'
''
'[x] Close script'
''
''

function UninstallAll(){
  Write-Host 'Uninstalling please stand by..'
  Start-Sleep -milliseconds 750
  Get-AppxPackage *bingfinance* | Remove-AppxPackage
  Get-AppxPackage *bingnews* | Remove-AppxPackage
  Get-AppxPackage *bingsports* | Remove-AppxPackage
  Get-AppxPackage *bingweather* | Remove-AppxPackage
  Get-AppxPackage *gethelp*  | Remove-AppxPackage
  Get-AppxPackage *getstarted* | Remove-AppxPackage
  Get-AppxPackage *messaging*  | Remove-AppxPackage
  Get-AppxPackage *mspaint*  | Remove-AppxPackage
  Get-AppxPackage *officehub*  | Remove-AppxPackage
  Get-AppxPackage *oneconnect*  | Remove-AppxPackage
  Get-AppxPackage *onenote* | Remove-AppxPackage
  Get-AppxPackage *people* | Remove-AppxPackage
  Get-AppxPackage *print3d* | Remove-AppxPackage
  Get-AppxPackage *skypeapp* | Remove-AppxPackage
  Get-AppxPackage *solitairecollection* | Remove-AppxPackage
  Get-AppxPackage *StickyNotes* | Remove-AppxPackage
  Get-AppxPackage *soundrecorder* | Remove-AppxPackage
  Get-AppxPackage *windowscamera* | Remove-AppxPackage
  Get-AppxPackage *windowsfeedbackhub*  | Remove-AppxPackage
  Get-AppxPackage *windowsmaps* | Remove-AppxPackage
  Get-AppxPackage *windowsphone* | Remove-AppxPackage
  Get-AppxPackage *windowsalarms* | Remove-AppxPackage
  Get-AppxPackage *xboxapp*  | Remove-AppxPackage
  Get-AppxPackage *zunemusic* | Remove-AppxPackage
  Get-AppxPackage *zunevideo* | Remove-AppxPackage
  Get-AppxPackage *3dbuilder* | Remove-AppxPackage
  Get-AppxPackage *3dviewer* | Remove-AppxPackage
}

function ReinstallAll(){
  Get-AppxPackage *bingfinance* | Add-AppxPackage
  Get-AppxPackage *bingnews* | Add-AppxPackage
  Get-AppxPackage *bingsports* | Add-AppxPackage
  Get-AppxPackage *bingweather* | Add-AppxPackage
  Get-AppxPackage *gethelp*  | Add-AppxPackage
  Get-AppxPackage *getstarted* | Add-AppxPackage
  Get-AppxPackage *messaging*  | Add-AppxPackage
  Get-AppxPackage *mspaint*  | Add-AppxPackage
  Get-AppxPackage *officehub*  | Add-AppxPackage
  Get-AppxPackage *oneconnect*  | Add-AppxPackage
  Get-AppxPackage *onenote* | Add-AppxPackage
  Get-AppxPackage *people* | Add-AppxPackage
  Get-AppxPackage *print3d* | Add-AppxPackage
  Get-AppxPackage *skypeapp* | Add-AppxPackage
  Get-AppxPackage *solitairecollection* | Add-AppxPackage
  Get-AppxPackage *StickyNotes* | Add-AppxPackage
  Get-AppxPackage *soundrecorder* | Add-AppxPackage
  Get-AppxPackage *windowscamera* | Add-AppxPackage
  Get-AppxPackage *windowsfeedbackhub*  | Add-AppxPackage
  Get-AppxPackage *windowsmaps* | Add-AppxPackage
  Get-AppxPackage *windowsphone* | Add-AppxPackage
  Get-AppxPackage *windowsalarms* | Add-AppxPackage
  Get-AppxPackage *xboxapp*  | Add-AppxPackage
  Get-AppxPackage *zunemusic* | Add-AppxPackage
  Get-AppxPackage *zunevideo* | Add-AppxPackage
  Get-AppxPackage *3dbuilder* | Add-AppxPackage
  Get-AppxPackage *3dviewer* | Add-AppxPackage
}

$option = 0

function GetOption {
  $option = Read-Host 'Begone:> Choose 1 - 27 to uninstall Windows built-in apps '
  ExecuteOption
}
function ExecuteOption {
  if ($option -eq '1') {
    Get-AppxPackage *bingfinance* | Remove-AppxPackage
  }
  Elseif ($option -eq '2') {
    Get-AppxPackage *bingnews* | Remove-AppxPackage
  }
  Elseif ($option -eq '3') {
    Get-AppxPackage *bingsports* | Remove-AppxPackage
  }
  Elseif ($option -eq '4') {
    Get-AppxPackage *Microsoft.BingWeather_4.28.3242.0_neutral_~_8wekyb3d8bbwe* | Remove-AppxPackage
  }
  Elseif ($option -eq '5') {
    Get-AppxPackage *gethelp*  | Remove-AppxPackage
  }
  Elseif ($option -eq '6') {
    Get-AppxPackage *getstarted* | Remove-AppxPackage
  }
  Elseif ($option -eq '7') {
    Get-AppxPackage *messaging*  | Remove-AppxPackage
  }
  Elseif ($option -eq '8') {
    Get-AppxPackage *mspaint*  | Remove-AppxPackage
  }
  Elseif ($option -eq '9') {
    Get-AppxPackage *officehub*  | Remove-AppxPackage
  }
  Elseif ($option -eq '10') {
    Get-AppxPackage *oneconnect*  | Remove-AppxPackage
  }
  Elseif ($option -eq '11') {
    Get-AppxPackage *onenote* | Remove-AppxPackage
  }
  Elseif ($option -eq '12') {
    Get-AppxPackage *people* | Remove-AppxPackage
  }
  Elseif ($option -eq '13') {
    Get-AppxPackage *print3d* | Remove-AppxPackage
  }
  Elseif ($option -eq '14') {
    Get-AppxPackage *skypeapp* | Remove-AppxPackage
  }
  Elseif ($option -eq '15') {
    Get-AppxPackage *solitairecollection* | Remove-AppxPackage
  }
  Elseif ($option -eq '16') {
    Get-AppxPackage *StickyNotes* | Remove-AppxPackage
  }
  Elseif ($option -eq '17') {
    Get-AppxPackage *soundrecorder* | Remove-AppxPackage
  }
  Elseif ($option -eq '18') {
    Get-AppxPackage *windowscamera* | Remove-AppxPackage
  }
  Elseif ($option -eq '19') {
    Get-AppxPackage *windowsfeedbackhub* | Remove-AppxPackage
  }
  Elseif ($option -eq '20') {
    Get-AppxPackage *windowsmaps* | Remove-AppxPackage
  }
  Elseif ($option -eq '21') {
    Get-AppxPackage *windowsphone* | Remove-AppxPackage
  }
  Elseif ($option -eq '22') {
    Get-AppxPackage *windowsalarms* | Remove-AppxPackage
  }
  Elseif ($option -eq '23') {
    Get-AppxPackage *xboxapp*  | Remove-AppxPackage
  }
  Elseif ($option -eq '24') {
    Get-AppxPackage *zunemusic* | Remove-AppxPackage
  }
  Elseif ($option -eq '25') {
    Get-AppxPackage *zunevideo* | Remove-AppxPackage
  }
  Elseif ($option -eq '26') {
    Get-AppxPackage *3dbuilder* | Remove-AppxPackage
  }
  Elseif ($option -eq '27') {
    Get-AppxPackage *3dviewer* | Remove-AppxPackage
  }
  Elseif ($option -eq 'u') { # The original statement is pretty much the nuclear option, it would remove more than just the apps.
    Write-Host 'Uninstalling builtin apps'
    # Get-AppxPackage -AllUsers| Foreach {Remove-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
    UninstallAll
  }
  Elseif ($option -eq 'r') { 
    Write-Host 'Reinstalling builtin apps'
    # Get-AppxPackage -AllUsers| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
    ReinstallAll
  }
  Elseif ($option -eq 'x') {
    Clear-Host
    exit
  }
  Else {
    [System.Media.SystemSounds]::Hand.play();
    Write-Warning 'Unknown parameter try again!'
  	Start-Sleep -milliseconds 500
  }
  GetOption
}
GetOption