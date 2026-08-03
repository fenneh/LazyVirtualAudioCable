$processes = Get-Process audiorepeater -ErrorAction SilentlyContinue

if ($processes) {
    Write-Host "$($processes.Count) audio repeater(s) running (PID: $($processes.Id -join ', '))."
} else {
    Write-Host "No audio repeaters running."
}
