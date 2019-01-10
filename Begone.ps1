#Pre calls
$softwareVersion = "Version 1.0"
$hostname = whoami
$osString = systeminfo | findstr /B /C:"OS Name" /C:"OS Name"

Clear-Host
    Write-Output ' ###########################################################'
    Write-Output ' #                                                         #'
    Write-Output ' #        Begone - Windows Built-in Apps remover           #'
    Write-Output " #        $softwareVersion                                      #"
    Write-Output ' #                                                         #'
    Write-Output ' #                                                         #'
    Write-Output ' ###########################################################'
    Write-Output ''

$color = $host.ui.RawUI.ForegroundColor
    $host.ui.RawUI.ForegroundColor = "Yellow"
    Write-Output " Current Device : $hostname"
    $host.ui.RawUI.ForegroundColor = $color
    Write-Output " Operating System : $osString"
    Write-Output ''
    Write-Output ' --- Windows Apps -------------------------------------------'

#Post Calls
''
'[1] Uninstall 3D Builder'
'[2] Uninstall Alarms and Clock'
'[3] Uninstall Calendar and Mail'
'[4] Uninstall Camera'
'[5] Uninstall Get Skype'
'[6] Uninstall Get Started'
'[7] Uninstall Groove Music'
'[8] Uninstall maps'
'[9] Uninstall Money'
'[10] Uninstall Movies & TV'
'[11] Uninstall News'
'[12] Uninstall OneNote'
'[13] Uninstall People'
'[14] Uninstall Phone Companion'
'[15] Uninstall Sports'
'[16] Uninstall Voice Recorder'
'[17] Uninstall Weather'
'[18] Uninstall 3D Viewer'
'[19] Uninstall Feedback Hub'
'[20] Uninstall Microsoft Solitaire Collection'
'[21] Uninstall Get Office'
'[22] Uninstall Paint 3D'
'[23] Uninstall Messaging'
'[24] Uninstall Xbox'
'[25] Uninstall Feedback hub'
'[26] Uninstall Get Help'
'[27] Uninstall Mixed Reality Portal - not implemented'
'[28] Uninstall Mobile plans'
'[29] Uninstall One Connect'
''
'[30] Uninstall All Apps in list'
'[31] Reinstall All Built-in apps'
''
'[32] Close script'
''
''
$option = 0

function Get-Option {
  $option = Read-Host 'Begone:> Choose 1 - 32 to uninstall Windows built-in apps. '
  Execute-Option
}
function Execute-Option {
  if ($option -eq '1') {
    Get-AppxPackage *3dbuilder* | Remove-AppxPackage
  }
  Elseif ($option -eq '2') {
    Get-AppxPackage *windowsalarms* | Remove-AppxPackage
  }
  Elseif ($option -eq '3') {
    Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage
  }
  Elseif ($option -eq '4') {
    Get-AppxPackage *windowscamera* | Remove-AppxPackage
  }
  Elseif ($option -eq '5') {
    Get-AppxPackage *skypeapp* | Remove-AppxPackage
  }
  Elseif ($option -eq '6') {
    Get-AppxPackage *getstarted* | Remove-AppxPackage
  }
  Elseif ($option -eq '7') {
    Get-AppxPackage *zunemusic* | Remove-AppxPackage
  }
  Elseif ($option -eq '8') {
    Get-AppxPackage *windowsmaps* | Remove-AppxPackage
  }
  Elseif ($option -eq '9') {
    Get-AppxPackage *bingfinance* | Remove-AppxPackage
  }
  Elseif ($option -eq '10') {
    Get-AppxPackage *zunevideo* | Remove-AppxPackage
  }
  Elseif ($option -eq '11') {
    Get-AppxPackage *bingnews* | Remove-AppxPackage
  }
  Elseif ($option -eq '12') {
    Get-AppxPackage *onenote* | Remove-AppxPackage
  }
  Elseif ($option -eq '13') {
    Get-AppxPackage *people* | Remove-AppxPackage
  }
  Elseif ($option -eq '14') {
    Get-AppxPackage *windowsphone* | Remove-AppxPackage
  }
  Elseif ($option -eq '15') {
    Get-AppxPackage *bingsports* | Remove-AppxPackage
  }
  Elseif ($option -eq '16') {
    Get-AppxPackage *soundrecorder* | Remove-AppxPackage
  }
  Elseif ($option -eq '17') {
    Get-AppxPackage *bingweather* | Remove-AppxPackage
  }
  Elseif ($option -eq '18') {
    Get-AppxPackage *3dviewer* | Remove-AppxPackage
  }
  Elseif ($option -eq '19') {
    Get-AppxPackage *windowsfeedbackhub* | Remove-AppxPackage
  }
  Elseif ($option -eq '20') {
    Get-AppxPackage *solitairecollection* | Remove-AppxPackage
  }
  Elseif ($option -eq '21') {
    Get-AppxPackage *officehub*  | Remove-AppxPackage
  }
  Elseif ($option -eq '22') {
    Get-AppxPackage *mspaint*  | Remove-AppxPackage
  }
  Elseif ($option -eq '23') {
    Get-AppxPackage *messaging*  | Remove-AppxPackage
  }
  Elseif ($option -eq '24') {
    Get-AppxPackage *xboxapp*  | Remove-AppxPackage
  }
  Elseif ($option -eq '25') {
    Get-AppxPackage *windowsfeedbackhub*  | Remove-AppxPackage
  }
  Elseif ($option -eq '26') {
    Get-AppxPackage *gethelp*  | Remove-AppxPackage
  }
  Elseif ($option -eq '27') {
    'Not implemented Mixed Reality'
  }
  Elseif ($option -eq '28') {
    'Not implemented Mobile Plans'
  }
  Elseif ($option -eq '29') {
    Get-AppxPackage *oneconnect*  | Remove-AppxPackage
  }
  Elseif ($option -eq '30') { # Uninstall everything in list.
    # Do something else
  }
  Elseif ($option -eq '31') { # If the user should need to reinstall Windows built-in apps for some reason...
    Get-AppxPackage -AllUsers| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
  }
  Elseif ($option -eq '32') {
    exit
  }
  Else {
  [System.Media.SystemSounds]::Hand.play();
  Write-Warning 'Unknown parameter try again!'
  	sleep -milliseconds 750
  }
  Get-Option
}
Get-Option