function Get-TargetResource {
	[OutputType([Hashtable])]
    param (
		[Parameter(Mandatory)]
        [ValidateSet('IEHardenAdmin', 'IEHardenUser')]
		[string] $Name
    )
	
	$key = $registryKeys.Get_Item($Name)
	$isInstalled = (Get-ItemProperty $key).IsInstalled
	
	if ($IsInstalled) { $ensure = 'Enabled' }
	else { $ensure = 'Disabled' }
	
	return @{
		Name = $Name
		Ensure = $ensure
	}
}
