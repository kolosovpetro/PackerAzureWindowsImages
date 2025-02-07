# Configures WinRM for Ansible Windows

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force;
$scriptUrl="https://raw.githubusercontent.com/AlbanAndrieu/ansible-windows/master/files/ConfigureRemotingForAnsible.ps1";
$localScriptPath="$env:TEMP\ConfigureRemotingForAnsible.ps1";
Invoke-WebRequest -Uri $scriptUrl -OutFile $localScriptPath -UseBasicParsing;powershell.exe -File $localScriptPath;