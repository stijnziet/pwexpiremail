Set-ExecutionPolicy bypass -force
$ConfirmPreference = 'None'
Install-Module PSWindowsUpdate -Force
Import-Module PSWindowsUpdate -Force
Get-WindowsUpdate -AcceptAll -Install
Set-ExecutionPolicy restricted -force
write-host "please reboot"