Write-Host 'A Name for the Script'
'1> Uninstall 3D Builder'
'2> Uninstall Alarms and Clock'
'3> Uninstall Calendar and Mail'
'4> Uninstall Camera'
'5> Uninstall Get Skype'
'6> Uninstall Get Started'
'7> Uninstall Groove Music'
'8> Uninstall maps'
'9> Uninstall Money'
'10> Uninstall Movies & TV'
'11> Uninstall News'
'12> Uninstall OneNote'
'13> Uninstall People'
'14> Uninstall Phone Companion'
'15> Uninstall Sports'
'16> Uninstall Voice Recorder'
'17> Uninstall Weather'
'18> Uninstall All Apps in list'
'19> Reinstall All Built-in apps'
'20> Close script'
''
''
$option = 0

function Get-Option {
  $option = Read-Host 'Begone:> Select 1 - 20 to uninstall built-in apps. '
  Execute-Option
}

function Execute-Option {
  if ($option -eq '1') {
    Get-AppxPackage *3dbuilder* | Remove-AppxPackage
  }
  if ($option -eq '2') {
    Get-AppxPackage *windowsalarms* | Remove-AppxPackage
  }
   if ($option -eq '3') {
    Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage
  }
  if ($option -eq '4') {
    Get-AppxPackage *windowscamera* | Remove-AppxPackage
  }
   if ($option -eq '5') {
    Get-AppxPackage *skypeapp* | Remove-AppxPackage
  }
  if ($option -eq '6') {
    Get-AppxPackage *getstarted* | Remove-AppxPackage
  }
   if ($option -eq '7') {
    Get-AppxPackage *zunemusic* | Remove-AppxPackage
  }
  if ($option -eq '8') {
    Get-AppxPackage *windowsmaps* | Remove-AppxPackage
  }
   if ($option -eq '9') {
    Get-AppxPackage *bingfinance* | Remove-AppxPackage
  }
  if ($option -eq '10') {
    Get-AppxPackage *zunevideo* | Remove-AppxPackage
  }
   if ($option -eq '11') {
    Get-AppxPackage *bingnews* | Remove-AppxPackage
  }
  if ($option -eq '12') {
    Get-AppxPackage *onenote* | Remove-AppxPackage
  }
   if ($option -eq '13') {
    Get-AppxPackage *people* | Remove-AppxPackage
  }
  if ($option -eq '14') {
    Get-AppxPackage *windowsphone* | Remove-AppxPackage
  }
   if ($option -eq '15') {
    Get-AppxPackage *bingsports* | Remove-AppxPackage
  }
  if ($option -eq '16') {
    Get-AppxPackage *soundrecorder* | Remove-AppxPackage
  }
   if ($option -eq '17') {
    Get-AppxPackage *bingweather* | Remove-AppxPackage
  }
  if ($option -eq '18') {
    # Do something else
  }
   if ($option -eq '19') {
    Get-AppxPackage -AllUsers| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
  }
  if ($option -eq '20') {
    exit
  }
  Get-Option
}

Get-Option