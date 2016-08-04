<#
.SYNOPSIS
	Returns timestamp in UFormat "%Y%m%d%H%M"
	
.DESCRIPTION
	Returns timestamp in UFormat YYYYMMDDHHmm
	
.EXAMPLE
	Get-Timestamp
 
#>
function Get-Timestamp {

	return (Get-Date -UFormat "%Y%m%d%H%M")
}






