function Get-TargetResource {
	[OutputType([Hashtable])]
    param (
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
        [ValidateSet('Domain', 'Private', 'Public')]
		[string] $Name
    )
	
    Write-Verbose "Getting firewall state for profile $Name"
    if ( (Get-NetFirewallProfile -Name Domain).Enabled ) {
		Write-Verbose "Firewall profile $Name is Enabled/Present"
		return @{
			Name = $Name
			Ensure = 'Present'
		}
	}
	
	Write-Verbose "Firewall profile $Name is Disabled/Absent"
	return @{
			Name = $Name
			Ensure = 'Absent'
		}
}
