function Set-TargetResource {
     param (
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string] $Name,
		
		[Parameter(Mandatory)]
        [ValidateSet('Enabled', 'Disabled')]
		[string] $Ensure
    )

	Write-Verbose "Configuring IEEnhancedSecurity: $Name ..."
    $current = (Get-TargetResource -Name $Name)
	
	$key = $registryKeys.$states.Get_Item($Name)
	if ($Ensure = 'Disabled') { 
		Set-ItemProperty -Path $key -Name 'IsInstalled' -Value 0 }
	else { Set-ItemProperty -Path $key -Name 'IsInstalled' -Value 1 }
	
	Write-Verbose "... IEEnhancedSecurity configured."
}