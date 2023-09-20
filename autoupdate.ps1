Set-ExecutionPolicy bypass -force
$ConfirmPreference = 'None'
Install-PackageProvider -Name NuGet -Force
Install-Module -Name NuGet -Force
Install-Module PSWindowsUpdate -Force
Import-Module PSWindowsUpdate -Force
Get-WindowsUpdate -AcceptAll -Install
Set-ExecutionPolicy restricted -force
