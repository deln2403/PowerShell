function Set-TargetResource {
     param (
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string] $DtcName,
		
        [ValidateSet('Mutual', 'Incoming', 'NoAuth')] [string] $AuthenticationLevel,
		[bool] $InboundTransactionsEnabled,
		[bool] $OutboundTransactionsEnabled,
		[bool] $RemoteClientAccessEnabled,
		[bool] $RemoteAdministrationAccessEnabled,
		[bool] $XATransactionsEnabled,
		[bool] $LUTransactionsEnabled
    )

    $current = (Get-TargetResource -DtcName $DtcName)
	Write-Verbose "Configuring DtcNetworkSetting ..."
	
	# RemoteClientAccessEnabled
	if ( $current['RemoteClientAccessEnabled'] -ne $RemoteClientAccessEnabled ) { $pass = $false }
	Write-Verbose "Setting RemoteClientAccessEnabled $RemoteClientAccessEnabled..."
	Set-DtcNetworkSetting -DtcName $DtcName -RemoteClientAccessEnabled $RemoteClientAccessEnabled -Confirm:$false
	
	# RemoteAdministrationAccessEnabled
	Write-Verbose "Setting RemoteAdministrationAccessEnabled $RemoteAdministrationAccessEnabled..."
	Set-DtcNetworkSetting -DtcName $DtcName -RemoteAdministrationAccessEnabled $RemoteAdministrationAccessEnabled -Confirm:$false
	
	# InboundTransactionsEnabled
	Write-Verbose "Setting InboundTransactionsEnabled $InboundTransactionsEnabled..."
	Set-DtcNetworkSetting -DtcName $DtcName -InboundTransactionsEnabled $InboundTransactionsEnabled -Confirm:$false
	
	# OutboundTransactionsEnabled
	if ( $current['OutboundTransactionsEnabled'] -ne $OutboundTransactionsEnabled ) { $pass = $false }
	Write-Verbose "Setting OutboundTransactionsEnabled $OutboundTransactionsEnabled..."
	Set-DtcNetworkSetting -DtcName $DtcName -OutboundTransactionsEnabled $OutboundTransactionsEnabled -Confirm:$false
	
	# AuthenticationLevel
	if ($current['AuthenticationLevel'] -ne $AuthenticationLevel ) { $pass = $false }
	Write-Verbose "Setting AuthenticationLevel $AuthenticationLevel..."
	Set-DtcNetworkSetting -DtcName $DtcName -AuthenticationLevel $AuthenticationLevel -Confirm:$false
	
	# XATransactionsEnabled
	if ($current['XATransactionsEnabled'] -ne $XATransactionsEnabled ) { $pass = $false }
	Write-Verbose "Setting XATransactionsEnabled $XATransactionsEnabled..."
	Set-DtcNetworkSetting -DtcName $DtcName -XATransactionsEnabled $XATransactionsEnabled -Confirm:$false
	
	# LUTransactionsEnabled
	if ($current['LUTransactionsEnabled'] -ne $LUTransactionsEnabled ) { $pass = $false }
	Write-Verbose "Setting XATransactionsEnabled $XATransactionsEnabled..."
	Set-DtcNetworkSetting -DtcName $DtcName -XATransactionsEnabled $XATransactionsEnabled -Confirm:$false
	
	
	Write-Verbose "... DtcNetworkSetting configured."
}