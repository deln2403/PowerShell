<#
$objUser = New-Object System.Security.Principal.NTAccount("nicolas.a.delorme")
$strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])
$strSID.Value
#>
