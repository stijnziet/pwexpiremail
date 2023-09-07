#Automated process of matching UPN's with AD/Azure sync
#Script by ditiswat.stijnziet.nl
#src: https://www.steijvers.com/2021/05/27/error-type-attributevaluemustbeunique/
#1 aug 2023

write-Host "UPN AD/AAD sync 0.1"
echo "---------------"
Write-Host "Login to 365"
Install-Module MSOnline
Import-Module MSOnline
Connect-MSOLService

function UPNsync {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]$naam
    )
    $guid = get-aduser -Identity $naam | Select -ExpandProperty ObjectGuid
    $upn = get-aduser -Identity $naam | select -ExpandProperty UserPrincipalName
    write-host "continue with:" $upn 
    pause
    write-host "Guid:" $guid
    $base64 = "" 
    #$guid = "815fbd36-983d-4304-82fc-370f4691c354"
    $base64 = [system.convert]::ToBase64String(([GUID]$guid).ToByteArray())
    write-host "Basse64:" $base64
    echo "---------------"

    #365 gedeelte
    Set-MsolUser -UserPrincipalName $upn -ImmutableId $base64
    Write-Host "Done"
    echo "---------------"
    Write-Host "Typ UPNsync -naam <voornaam> <achternaam>"
    echo "---------------"
}
Write-Host "Script loaded..."
Write-Host "Typ UPNsync -naam <voornaam> <achternaam>"
echo "---------------"
