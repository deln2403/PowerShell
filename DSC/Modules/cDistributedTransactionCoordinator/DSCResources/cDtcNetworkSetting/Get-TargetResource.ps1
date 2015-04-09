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
		NetworkDtcAccessClients = [bool] $dtc.NetworkDtcAccessClients
		NetworkDtcAccessAdmin = [bool] $dtc.NetworkDtcAccessAdmin
		NetworkDtcAccessInbound = [bool] $dtc.NetworkDtcAccessInbound
		NetworkDtcAccessOutbound = [bool] $dtc.NetworkDtcAccessOutbound
		XaTransactions = [bool] $dtc.XaTransactions
		LuTransactions = [bool] $dtc.LuTransactions
	}
}
