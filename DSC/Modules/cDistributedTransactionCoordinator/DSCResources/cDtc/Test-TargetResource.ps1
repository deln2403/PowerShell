function Test-TargetResource {
    param (
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string] $DtcName,
		
		[ValidateSet('Started', 'Stopped')] [string] $Status = 'Started'
    )
 
	$pass = $true
    $current = (Get-TargetResource -DtcName $DtcName)
	
	# Status
	if ( $current['Status'] -ne $Status ) { $pass = $false }
	Write-Verbose "Status::  Desired: $Status  |  Current: $($current['Status'])  |  Pass: $pass"
	
	return $pass
}
