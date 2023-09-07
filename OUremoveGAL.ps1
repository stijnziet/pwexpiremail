#Removing users in specific OU's from GAL
#Script by ditiswat.stijnziet.nl
#9 aug 2023

Start-Transcript C:\tmp\GAL.log
#Variables:
$ouName = "Disabled Users"
$domain = "DC=<domain name>,DC=local"
#-------------------------

$ouPaths = Get-ADOrganizationalUnit -Filter 'Name -like $ouName' -SearchBase $domain | Select-Object -ExpandProperty DistinguishedName

foreach ($ouPath in $ouPaths)
{
    # Get the users from the OU and display their properties
    $users = Get-ADUser -Filter * -SearchBase $ouPath
    echo ==========
    Write-Host "Current OU: "$ouPath -ForegroundColor yellow
    echo -----------
        foreach ($user in $users) 
        {
        $name = $user.Name
        $DN = $user.DistinguishedName
        $property = Get-ADUser -Identity $DN -Properties msExchHideFromAddressLists | Select-Object -ExpandProperty msExchHideFromAddressLists
        write-host $name pre-HideGAL: $property
        Set-ADUser -Identity $DN -Replace @{msExchHideFromAddressLists=$true}
        $property = Get-ADUser -Identity $DN -Properties msExchHideFromAddressLists | Select-Object -ExpandProperty msExchHideFromAddressLists
        write-host $name post-HideGAL: $property
        write-host "--------------------------"
        }
    write-host "End of OU" -ForegroundColor green
}
Stop-Transcript
