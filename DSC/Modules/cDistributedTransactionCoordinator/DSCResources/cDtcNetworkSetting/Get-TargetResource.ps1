function Get-TargetResource {
	[OutputType([Hashtable])]
    param (
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string] $DtcName
    )
	
	$regkey = 'HKLM:\SOFTWARE\Microsoft\MSDTC\Security'
	$dtc = Get-ItemProperty $regKey
	
	return @{
		AuthenticationLevel = (Get-DtcNetworkSetting).AuthenticationLevel
		RemoteClientAccessEnabled = [bool] $dtc.NetworkDtcAccessClients
		RemoteAdministrationAccessEnabled = [bool] $dtc.NetworkDtcAccessAdmin
		InboundTransactionsEnabled = [bool] $dtc.NetworkDtcAccessInbound
		OutboundTransactionsEnabled = [bool] $dtc.NetworkDtcAccessOutbound
		XATransactionsEnabled = [bool] $dtc.XaTransactions
		LUTransactionsEnabled = [bool] $dtc.LuTransactions
	}
}
