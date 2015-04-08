function Test-TargetResource {
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
 
	Write-Verbose "Testing firewall state for profile $Name"
    $current = (Get-TargetResource -Name $Name)
    $pass = $current['Ensure'] -eq $Ensure
	
    Write-Verbose "Firewall profile $Name:: Desired: $Ensure  Current: $($current['Ensure'])  Pass: $pass"
    return $pass
}
