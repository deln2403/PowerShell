function Set-TargetResource {
     param (
		[Parameter(Mandatory)]
        [ValidateSet('IEHardenAdmin', 'IEHardenUser')]
		[string] $Name,
		
		[Parameter(Mandatory)]
        [ValidateSet('Enabled', 'Disabled')]
		[string] $Ensure
    )

	Write-Verbose "Configuring InternetExplorerEsc: $Name ..."
	
	$key = $registryKeys.Get_Item($Name)
	Write-Verbose "Toggling $key\IsInstalled"
	
	if ($Ensure -eq 'Disabled') { Set-ItemProperty -Path $key -Name 'IsInstalled' -Value 0 }
	else { Set-ItemProperty -Path $key -Name 'IsInstalled' -Value 1 }
	
	Write-Verbose "... InternetExplorerEsc configured."
}