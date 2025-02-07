Try
{
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));
}
Catch
{
    Write-Host "Chocolatey reboot requested. Rebooting...";
    exit 0;
}
