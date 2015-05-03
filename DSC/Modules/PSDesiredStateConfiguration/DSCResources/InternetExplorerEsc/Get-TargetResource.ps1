function Get-TargetResource {
	[OutputType([Hashtable])]
    param (
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string] $Name
    )
	
	$key = $registryKeys.$states.Get_Item($Name)
	$isInstalled = (Get-ItemProperty $key).IsInstalled
	
	if ($isInstalled) { $ensure = 'Disabled' }
	else { $ensure = 'Enabled' }
	
	return @{
		Name = $Name
		Ensure = $ensure
	}
}
