function Test-TargetResource {
     param (
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string] $Name,
		
		[Parameter(Mandatory)]
        [ValidateSet('Enabled', 'Disabled')]
		[string] $Ensure
    )
 
	$pass = $true
    $current = (Get-TargetResource -Name $Name)
	
	if ($current['Ensure'] -ne $Ensure ) { $pass = $false }
	Write-Verbose "IEEnhancedSecurity::  Desired: $Ensure  |  Current: $($current['Ensure'])  |  Pass: $pass"
	
	return $pass
}
