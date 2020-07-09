$SoftwareVersion = "V2 - 06-11-2019"
$Author = "Built by SB-Ansel"
$Hostname = whoami
$Color = $host.ui.RawUI.ForegroundColor

Clear-Host # Clears previous entered commands from the PS windows.
Write-Host '***********************************************************'
Write-Host '*                                                         *'
Write-Host '*        Begone - Windows Built-in Apps remover           *'
Write-Host '*        USE AT YOUR OWN RISK                             *'
Write-Host "*        $SoftwareVersion                                   *"
Write-Host "*        $Author                                *"
Write-Host '*                                                         *'
Write-Host '***********************************************************'
Write-Host ''

$host.ui.RawUI.ForegroundColor = "Yellow"
Write-Host "Current Device/User : $Hostname"
$host.ui.RawUI.ForegroundColor = $Color
Write-Host ''
Write-Host '--Windows Installation check--------------------------------'.ToUpper()
# Check for deleted appx packages
function PreInitialization (){
  Write-Host 'Current Appx Packages deleted: ', (Get-ChildItem $env:SystemDrive'\Program Files\WindowsApps\DeletedAllUserPackages').Count
  Write-Host ''
# Get current execution policy
$Preinit = Get-ExecutionPolicy
Write-Host '--Windows Policy Check--------------------------------------'.ToUpper()
if ($Preinit -eq 'Unrestricted'){
    Write-Host 'Current policy set to: Unrestricted'
} 
Elseif ($Preinit -eq 'RemoteSigned'){
  Write-Host 'Current policy set to: RemoteSigned'
}
Elseif ($Preinit -eq 'Undefined'){
  Write-Host 'Current policy set to: Undefined'
  $policy = Read-Host 'Warning: Your current system execution policy only allows signed scripts to run, would you like too turn on unrestricted execution policy? y/n '
  if ($policy -eq 'y'){
    Set-ExecutionPolicy -Scope CurrentUser Unrestricted
    $GetPolicy = Get-ExecutionPolicy
    if ($GetPolicy -eq 'Unrestricted'){
      Write-Host $GetPolicy
    }
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
}

PreInitialization
#Initalization
function Initalization(){
Write-Host ''
Write-Host '--Provisioned Appx Packages for this Windows version--------'.ToUpper()
Write-Host ''
$int = 1
$Path = Get-ChildItem $env:SystemDrive'\Program Files\WindowsApps\DeletedAllUserPackages' | Select-String Microsoft | Sort-Object Microsoft
$Appx = (DISM /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Sort-Object PackageName)
$Appx = $Appx -replace('PackageName','')
# $Appx = $Appx -replace('Microsoft','')
$Appx = $Appx -replace(':','')
$Appx = $Appx -replace(' ','')

foreach ($item in $Path) {
  if ($Path -notcontains $Appx) {
  $host.ui.RawUI.ForegroundColor = "Yellow"
  Write-Host ([int]$int++) :> $Appx
  $host.ui.RawUI.ForegroundColor = $Color
  }elseif ($Path -contains $Appx) {
    $host.ui.RawUI.ForegroundColor = "Green"
    Write-Host ([int]$int++) :> $Appx
    $host.ui.RawUI.ForegroundColor = $Color
  }else{
    'This is really screwing the pouch'
  }
}
# } elseif  ($Path -notmatch 'Microsoft.'){
#   $host.ui.RawUI.ForegroundColor = "DarkYellow"
#     $Path
#   $host.ui.RawUI.ForegroundColor = $Color
# }}

# $Appx | ForEach-Object {Write-Host ([int]$int++) :> $_}
}

Initalization
''
''
'[u] Uninstall all apps in list'
'[r] Reinstall all apps in list'
''
'[x] Close script'
''
''

function UninstallAll(){
  # (Something) + Remove-AppxPackage
}
# A better way of doing this would be to get package name and just append either add-appxpackage or remove-appxpackage.
function ReinstallAll(){
  # (Something) + Add-AppxPackage
}

$option = 0

function GetOption {
  $option = Read-Host 'Begone:> Choose 1 ' $int ' to uninstall Windows built-in apps '
  # ExecuteOption
}
function ExecuteOption { # We need a variable for either -User J-Madden or -AllUsers. 
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
