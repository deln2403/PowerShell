function Set-TargetResource {
     param (
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string] $DtcName,
		
        [ValidateSet('Started', 'Stopped')] [string] $Status = 'Started'
    )

	$current = (Get-TargetResource -DtcName $DtcName)
	Write-Verbose "Configuring DTC..."
	
	# Status
    if ( $current['Status'] -ne $Status ) {
		if ( $Status -eq 'Started' ) {
			Write-Verbose "Starting service ..."
			Start-Service -Name MSDTC }
        elseif ( $Status -eq 'Stopped' ) {
			Write-Verbose "Stopping service ..."
			Stop-Service -Name MSDTC }
    }
	
	Write-Verbose "... DTC configured."
}