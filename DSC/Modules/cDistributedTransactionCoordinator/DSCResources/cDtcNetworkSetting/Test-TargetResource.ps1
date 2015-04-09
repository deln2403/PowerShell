function Test-TargetResource {
    param (
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string] $DtcName,
		
        [bool] $RemoteClientAccessEnabled,
		[bool] $RemoteAdministrationAccessEnabled,
		[bool] $InboundTransactionsEnabled,
		[bool] $OutboundTransactionsEnabled,		
		[ValidateSet('Mutual', 'Incoming', 'NoAuth')] [string] $AuthenticationLevel,
		[bool] $XATransactionsEnabled,
		[bool] $LUTransactionsEnabled
    )
 
	$pass = $true
    $current = (Get-TargetResource -DtcName $DtcName)
	
	# RemoteClientAccessEnabled
	if ( $current['RemoteClientAccessEnabled'] -ne $RemoteClientAccessEnabled ) { $pass = $false }
	Write-Verbose "RemoteClientAccessEnabled::  Desired: $RemoteClientAccessEnabled  |  Current: $($current['RemoteClientAccessEnabled'])  |  Pass: $pass"
	
	# RemoteAdministrationAccessEnabled
	if ($current['RemoteAdministrationAccessEnabled'] -ne $RemoteAdministrationAccessEnabled ) { $pass = $false }
	Write-Verbose "RemoteAdministrationAccessEnabled::  Desired: $RemoteAdministrationAccessEnabled  |  Current: $($current['RemoteAdministrationAccessEnabled'])  |  Pass: $pass"
	
	# InboundTransactionsEnabled
	if ($current['InboundTransactionsEnabled'] -ne $InboundTransactionsEnabled ) { $pass = $false }
	Write-Verbose "InboundTransactionsEnabled::  Desired: $InboundTransactionsEnabled  |  Current: $($current['InboundTransactionsEnabled'])  |  Pass: $pass"
	
	# OutboundTransactionsEnabled
	if ( $current['OutboundTransactionsEnabled'] -ne $OutboundTransactionsEnabled ) { $pass = $false }
	Write-Verbose "OutboundTransactionsEnabled::  Desired: $OutboundTransactionsEnabled  |  Current: $($current['OutboundTransactionsEnabled'])  |  Pass: $pass"
	
	# AuthenticationLevel
	if ($current['AuthenticationLevel'] -ne $AuthenticationLevel ) { $pass = $false }
	Write-Verbose "AuthenticationLevel::  Desired: $AuthenticationLevel  |  Current: $($current['AuthenticationLevel'])  |  Pass: $pass"
	
	# XATransactionsEnabled
	if ($current['XATransactionsEnabled'] -ne $XATransactionsEnabled ) { $pass = $false }
	Write-Verbose "XATransactionsEnabled::  Desired: $XATransactionsEnabled  |  Current: $($current['XATransactionsEnabled'])  |  Pass: $pass"
	
	# LUTransactionsEnabled
	if ($current['LUTransactionsEnabled'] -ne $LUTransactionsEnabled ) { $pass = $false }
	Write-Verbose "LUTransactionsEnabled::  Desired: $LUTransactionsEnabled  |  Current: $($current['LUTransactionsEnabled'])  |  Pass: $pass"
	
	return $pass
}
