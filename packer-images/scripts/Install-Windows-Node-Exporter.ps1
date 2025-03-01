# PowerShell Script to Install Prometheus Windows Exporter and Configure Firewall Rule

# Variables
$exporterVersion = "0.30.4"  # Change this to the latest version if needed
$downloadUrl = "https://github.com/prometheus-community/windows_exporter/releases/download/v$exporterVersion/windows_exporter-$exporterVersion-amd64.msi"
$installPath = "C:\Program Files\windows_exporter"
$serviceName = "windows_exporter"
$firewallRuleName = "Prometheus Windows Exporter 9182"

# Step 1: Download Windows Exporter MSI
Write-Host "Downloading Prometheus Windows Exporter..."
Invoke-WebRequest -Uri $downloadUrl -OutFile "C:\temp\windows_exporter.msi"

# Step 2: Install the Windows Exporter
Write-Host "Installing Prometheus Windows Exporter..."
Start-Process msiexec.exe -ArgumentList "/i", "C:\temp\windows_exporter.msi", "/quiet", "/norestart" -Wait

# Step 3: Configure the Windows Exporter Service
Write-Host "Configuring Windows Exporter service..."

# Ensure the service is running and will start on boot
Set-Service -Name $serviceName -StartupType Automatic
Start-Service -Name $serviceName

# Step 4: Verify Installation
Write-Host "Verifying Windows Exporter service..."
$serviceStatus = Get-Service -Name $serviceName
if ($serviceStatus.Status -eq "Running")
{
    Write-Host "Prometheus Windows Exporter is running successfully!"
}
else
{
    Write-Host "Prometheus Windows Exporter service failed to start. Please check logs."
}

# Step 5: Add Windows Firewall Inbound Rule for Port 9182
Write-Host "Adding Firewall inbound rule for port 9182..."
New-NetFirewallRule -DisplayName $firewallRuleName -Name $firewallRuleName -Protocol TCP -LocalPort 9182 -Action Allow -Direction Inbound

# Cleanup the installer
Remove-Item -Path "C:\temp\windows_exporter.msi" -Force

# Step 6: Configure Prometheus to scrape Windows Exporter
Write-Host "To scrape the Windows Exporter from Prometheus, add the following configuration in your prometheus.yml file:"
Write-Host "  - job_name: 'windows_exporter'"
Write-Host "    static_configs:"
Write-Host "      - targets: ['<windows-machine-ip>:9182']"

Write-Host "Installation Complete!"
