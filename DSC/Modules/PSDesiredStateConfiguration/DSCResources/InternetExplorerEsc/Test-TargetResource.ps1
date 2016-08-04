function Test-TargetResource {
     param (
		[Parameter(Mandatory)]
        [ValidateSet('IEHardenAdmin', 'IEHardenUser')]
		[string] $Name,
		
		[Parameter(Mandatory)]
        [ValidateSet('Enabled', 'Disabled')]
		[string] $Ensure
    )
 
	$pass = $true
    $current = (Get-TargetResource -Name $Name)
	
	if ($current['Ensure'] -ne $Ensure ) { $pass = $false }
	Write-Verbose "InternetExplorerEsc::  Desired: $Ensure  |  Current: $($current['Ensure'])  |  Pass: $pass"
	
	return $pass
}
