function Get-TargetResource {
	[OutputType([Hashtable])]
    param (
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string] $DtcName
    )
	
	$dtc = Get-Dtc
	
	return @{
		DtcName = $dtc.DtcName
		VirtualServerName = $dtc.VirtualServerName
		Status = $dtc.Status
	}
}
