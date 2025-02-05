# Set ConfirmPreference to None to suppress confirmation prompts
$ConfirmPreference = 'None'

Write-Host "Installing Windows Update PS module..."
Install-Module PSWindowsUpdate -Force -AllowClobber
Import-Module PSWindowsUpdate

Write-Host "Checking for updates..."
$updates = Get-WindowsUpdate -MicrosoftUpdate -AcceptAll -Install

if ($updates.Count -gt 0) {
    Write-Host "Updates have been installed. Rebooting the system..."
} else {
    Write-Host "No updates were installed. Rebooting the system..."
}
