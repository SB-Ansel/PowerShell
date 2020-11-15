$SoftwareVersion = "2020-11-15 - V1"
$Author = "SB-Ansel"
$UpdatePolicy = Set-ExecutionPolicy -Scope CurrentUser Unrestricted
Clear-Host # Clears previous entered commands from the PS windows.
Write-Host '***********************************************************'
Write-Host '*                                                         *'
Write-Host '*        WinCheck - Windows System Util                   *'
Write-Host '*        USE AT YOUR OWN RISK                             *'
Write-Host "*        $SoftwareVersion                                  *"
Write-Host "*        $Author                                         *"
Write-Host '*                                                         *'
Write-Host '***********************************************************'
Write-Host ''
# function PreInitialization (){
#   # Get current execution policy
#   $Preinit = Get-ExecutionPolicy
#   Write-Host '--Windows Policy Check--------------------------------------'.ToUpper()
#   if ($Preinit -eq 'Unrestricted'){
#       Write-Host 'Current policy set to: '$Preinit''
#     }
#   Elseif ($Preinit -eq 'RemoteSigned'){
#     Write-Host 'Current policy set to:'$Preinit''
#   }
#   Elseif ($Preinit -eq 'Undefined'){
#     Write-Host 'Current policy set to:'$Preinit''
#     $policy = Read-Host 'Warning: Your execution policy only allows signed scripts to run, would you like to turn on unrestricted execution policy? y/n '
#     if ($policy -eq 'y'){
#         $UpdatePolicy
#       $GetPolicy = Get-ExecutionPolicy
#       if ($GetPolicy -eq 'Unrestricted'){
#         Write-Host $GetPolicy
#       }
#     }
#   Elseif ($Preinit -eq 'AllSigned'){
#     Write-Host 'Current policy set to: AllSigned'
#     $policy = Read-Host 'Warning: Your current system execution policy only allows signed scripts to run, would you like too turn on unrestricted execution policy? y/n '
#     if ($policy -eq 'y'){
#         $UpdatePolicy
#       Start-Sleep -milliseconds 500
#       $GetPolicy = Get-ExecutionPolicy
#       if ($GetPolicy -eq 'Unrestricted'){
#         Write-Host $GetPolicy
#         Start-Sleep -milliseconds 500
#       }
#       else{
#         Write-Host 'Something went wrong :/'
#         Write-Host 'Try running Set-ExecutionPolicy -Scope CurrentUser Unrestricted from an Administrative PowerShell.'
#         Start-Sleep -milliseconds 750
#         Clear-Host
#         exit
#       }
#     } 
#     Elseif ($policy -ne 'y'){
#       Write-Host 'Exiting...'
#       Start-Sleep -milliseconds 500
#       Clear-Host
#       exit
#       } 
#   }
#   else{
#     Write-Host 'Unknown Execution Policy, Exiting'
#     Start-Sleep -milliseconds 500
#     Clear-Host
#     exit
#     }
#     }
#     }     
Write-Host '--Windows Powershell Check----------------------------------'.ToUpper()
WinSat preprop
(Get-CimInstance Win32_WinSat)