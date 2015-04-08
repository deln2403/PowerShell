function Set-TargetResource {
    param ( 
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
        [ValidateSet('Domain', 'Private', 'Public')]
		[string] $Name,
		
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
        [ValidateSet('Present', 'Absent')]
        [string]$Ensure
    )
	
	Write-Verbose "Configuring firewall profile $Name as $Ensure..."
    $current = Get-TargetResource -Name $Name
	
	# Enable
    if ($Ensure -eq 'Present' -and $current['Ensure'] -eq 'Absent') {
        Write-Verbose "Enabling ..."
		Set-NetFirewallProfile -Enabled 'true' -Name $name -PassThru
        Write-Verbose "... enabled."
    }
	
	# Disable
    elseif ($Ensure -eq 'Absent' -and $current['Ensure'] -eq 'Present') {
		Write-Verbose "Disabling ..."
		Set-NetFirewallProfile -Enabled 'false' -Name $name -PassThru
		Write-Verbose "... disabled."		
    } 
	
	Write-Verbose "Firewall profile $Name configured as $Ensure."
}