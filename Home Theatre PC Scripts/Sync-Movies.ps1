# Sync Movies from Seedbox to local storage
# This script only downloads new files, ignoring what's already there
# Runs automatically every 4 hours via Task Scheduler

$logFile = "C:\Scripts\Logs\movie-sync-$(Get-Date -Format 'yyyy-MM-dd').log"

# Create directories if they don't exist
New-Item -ItemType Directory -Force -Path "C:\Movies" | Out-Null
New-Item -ItemType Directory -Force -Path "C:\Scripts\Logs" | Out-Null

Write-Host "Starting movie sync at $(Get-Date)" | Tee-Object -FilePath $logFile -Append

# Replace 'seedbox' with your rclone remote name
rclone copy seedbox:Movies/ C:\Movies\ --progress --log-file=$logFile --log-level INFO

Write-Host "Movie sync completed at $(Get-Date)" | Tee-Object -FilePath $logFile -Append