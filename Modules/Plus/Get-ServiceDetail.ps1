<#
.SYNOPSIS
    Returns service details

.DESCRIPTION
    Uses a WMI call to get additional service details
    
.EXAMPLE
    Get-ServiceDetail

#>

function Get-ServiceDetail {
	Param()

	Get-CimInstance win32_service
	
}