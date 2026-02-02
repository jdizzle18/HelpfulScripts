# Download TV shows from Seedbox
# Only downloads files from the last 14 days that don't already exist locally
# Usage: .\Download-TVShow.ps1 -ShowName "Show Name" -Season "Season 1"

param(
    [Parameter(Mandatory=$true)]
    [string]$ShowName,
    
    [Parameter(Mandatory=$false)]
    [string]$Season = ""
)

# Create log file
$logFile = "C:\Scripts\Logs\tvshow-sync-$(Get-Date -Format 'yyyy-MM-dd').log"
New-Item -ItemType Directory -Force -Path "C:\Scripts\Logs" | Out-Null

# Replace 'seedbox' with your rclone remote name
$sourcePath = "seedbox:TV Shows/"

# Build destination path based on parameters
$destPath = "C:\TV Shows\$ShowName"
if ($Season) {
    $destPath = "$destPath\$Season"
}

Write-Host "Downloading new files from the last 14 days" | Tee-Object -FilePath $logFile -Append
Write-Host "From: $sourcePath" | Tee-Object -FilePath $logFile -Append
Write-Host "To: $destPath" | Tee-Object -FilePath $logFile -Append
Write-Host "" | Tee-Object -FilePath $logFile -Append

# Create destination folder if it doesn't exist
New-Item -ItemType Directory -Force -Path $destPath | Out-Null

# Download only files that don't exist locally and are within 14 days old
rclone copy $sourcePath $destPath --progress --max-age 14d --ignore-existing --log-file=$logFile --log-level INFO

Write-Host "" | Tee-Object -FilePath $logFile -Append
Write-Host "Download complete!" | Tee-Object -FilePath $logFile -Append