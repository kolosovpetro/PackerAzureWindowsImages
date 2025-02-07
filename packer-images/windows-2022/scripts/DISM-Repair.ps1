$logFile = "C:\DISM_Check.log"

function Write-Log
{
    param([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $message" | Out-File -Append -FilePath $logFile
}

Write-Log "Starting DISM health check..."

Write-Host "Checking Windows Image Health..."
$checkHealth = dism /Online /Cleanup-Image /CheckHealth
Write-Log "CheckHealth Output: $checkHealth"

Write-Host "Scanning Windows Image for corruption..."
$scanHealth = dism /Online /Cleanup-Image /ScanHealth
Write-Log "ScanHealth Output: $scanHealth"

if ($scanHealth -match "repairable")
{
    Write-Host "Corruption found! Attempting to restore system health..."
    Write-Log "Restoring Windows Image Health..."

    $restoreHealth = dism /Online /Cleanup-Image /RestoreHealth
    Write-Log "RestoreHealth Output: $restoreHealth"

    if ($restoreHealth -match "The restore operation completed successfully")
    {
        Write-Host "System image restored successfully!"
        Write-Log "System image restored successfully!"
    }
    else
    {
        Write-Host "Failed to restore system image. Check logs for details."
        Write-Log "Failed to restore system image. Further investigation needed."
    }
}
else
{
    Write-Host "No corruption detected."
    Write-Log "No corruption detected."
}

Write-Log "DISM health check completed."
