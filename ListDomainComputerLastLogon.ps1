#List Domain Computers by last login, filtering out computers newer than $oldest
#Script by ditiswat.stijnziet.nl
#Credits: https://theitbros.com/get-last-logged-on-user/#Finding_Last_Logon_Time_in_ADUC
#9 aug 2023

$oldest = (Get-Date).AddDays(-180)
Get-ADComputer -Filter { LastLogonTimeStamp -lt $oldest } -Properties LastLogon, LastLogonTimestamp | Select-Object Name, @{n = 'LastLogon'; e = { [DateTime]::FromFileTime($_.LastLogon) } }, @{n = 'LastLogonTimeStamp'; e = { [DateTime]::FromFileTime($_.LastLogonTimeStamp) } } | Sort-Object lastlogontimestamp

