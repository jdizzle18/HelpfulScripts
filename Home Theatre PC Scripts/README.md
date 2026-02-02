# Seedbox Sync Scripts

PowerShell scripts for syncing media from a seedbox using rclone.

## Prerequisites

- [Rclone](https://rclone.org/) installed and configured
- PowerShell execution policy set to allow scripts: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

## Setup

1. Configure rclone with your seedbox connection (name it `seedbox` or update the scripts with your remote name)
2. Create the scripts directory: `C:\Scripts\`
3. Copy the scripts to `C:\Scripts\`

## Scripts

### Sync-Movies.ps1
Automatically syncs all movies from seedbox to local storage.
- Can be scheduled to run every 4 hours via Task Scheduler
- Downloads only new files

### Download-TVShow.ps1
Manually download TV show episodes from the last 14 days.

**Usage:**
```powershell
.\Download-TVShow.ps1 -ShowName "Breaking Bad" -Season "Season 1"
```

### Download-Other.ps1
Download miscellaneous content from the last 5 days to custom folder structure.

**Usage:**
```powershell
.\Download-Other.ps1 -Category "Anime" -ShowName "Dragon Ball Z" -Season "Season 2"
```

## Task Scheduler Setup (for automatic movie sync)

1. Open Task Scheduler
2. Create Task → General tab: Name it, check "Run whether user is logged on or not"
3. Triggers tab → New → Daily, repeat every 4 hours
4. Actions tab → New → Program: `powershell.exe`, Arguments: `-ExecutionPolicy Bypass -File "C:\Scripts\Sync-Movies.ps1"`

## Configuration

Update these variables in the scripts to match your setup:
- Rclone remote name (currently `seedbox`)
- Local destination paths (currently `C:\Movies`, `C:\TV Shows`, etc.)
- Log file location (currently `C:\Scripts\Logs\`)