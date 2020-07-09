# Watchmen restart script by SB-Ansel
# Little script which indefinitely loops and opens a program if it's closed until the parent PS window is closed. Useful if you want a program like a remote desktop client like TeamViewer to always stay online.

$Color = $host.ui.RawUI.ForegroundColor

function IsItAlive(){
    $ProcessName = Get-Process | Select-String "AnyDesk"
    if ($ProcessName -match "AnyDesk"){
        $host.ui.RawUI.ForegroundColor = "DarkCyan"
        Write-Host "    Application already running. No further action required!"
        $host.ui.RawUI.ForegroundColor = $Color
    } elseif ($ProcessName -ne "AnyDesk") {
        Start-Process -FilePath 'FilePath' # Need manually enter file path to executable
        $host.ui.RawUI.ForegroundColor = "DarkRed"
        Write-Host '    Application not running. Automatic restart initiated!'
        $host.ui.RawUI.ForegroundColor = $Color
    }else {
        $host.ui.RawUI.ForegroundColor = "DarkRed"
        Write-Host "    An unanticipated error has occurred contact Administator!"
        $host.ui.RawUI.ForegroundColor = $Color
    }
}

while ($true) {
    Start-Sleep -Seconds 3600 # Time == 1 Hour
    # Start-Sleep -Seconds 10 # Time == 10 Seconds Testing purpose
    $i++
    $Time = Get-Date -Format G
    $host.ui.RawUI.ForegroundColor = "Yellow"
    Write-Host 'Watchmen :> Last run at :'$Time
    $host.ui.RawUI.ForegroundColor = $Color
    IsItAlive # Query Get-Process
}